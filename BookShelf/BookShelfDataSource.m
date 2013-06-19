//
//  BookShelfDataSource.m
//  BookShelf
//
//  Created by Andrew Polkinghorn on 24/05/2013.
//
//  Copyright 2013 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "BookShelfDataSource.h"
#import "BookShelfView.h"

#import <ShinobiEssentials/SEssentialsAccordionSection.h>

#define SECTION_HEIGHT 102.4
#define BOOKSHELF_VIEW_HEIGHT 668
#define BOOKSHELF_VIEW_WIDTH 350

//  The BookShelfDataSource class supplies an SEssentialsAccordion with all its sections
//  created using the array of books in the BookShelfArchive class. It also returns the views
//  for each section when it has been opened.
@implementation BookShelfDataSource {
    NSMutableDictionary *_dataMapping;
    BookShelfArchive *_archive;
}

- (id)initWithBookShelfArchive:(BookShelfArchive*)archive
{
    self = [super init];
    if (self) {
        _sections = [NSMutableArray new];
        _dataMapping = [[NSMutableDictionary alloc] init];
        _archive = archive;
        
        [self setupData];
    }
    return self;
}

// Creates a SEssentialsAccordionSection for each book in the BookShelfArchive
-(void)setupData {
    for(int i = 0; i<[_archive books].count;i++){
        Book *book = [_archive books][i];
        BookShelfView *bookView = [[BookShelfView alloc] initWithFrame:CGRectMake(0,
                                                                                  0,
                                                                                  BOOKSHELF_VIEW_WIDTH,
                                                                                  BOOKSHELF_VIEW_HEIGHT)
                                                              withBook:book];
        SEssentialsAccordionSection *section = [[SEssentialsAccordionSection alloc] initWithFrame:CGRectMake(0,
                                                                                                             0,
                                                                                                             BOOKSHELF_VIEW_WIDTH,
                                                                                                             SECTION_HEIGHT)
                                                                                         andTitle:book.title];
        // Style section headers
        [[[section header] style] setBackgroundColor:book.spineColor];
        [[[section header] style] setSelectedBackgroundColor:book.spineColor];
        [[[section header] style] setSectionBackgroundColor:book.coverColor];
        [[[section header] style] setFont:[UIFont fontWithName:@"GillSans" size:30]];
        [[[section header] style] setFontColor:[UIColor orangeColor]];
        
        [_dataMapping setObject:bookView forKey:[NSValue valueWithPointer:CFBridgingRetain(section)]];
        [_sections addObject:section];
    }
}

// Returns the UIView that will appear when a specific section is opened.
-(UIView *)accordion:(SEssentialsAccordion *)accordion contentForSection:(SEssentialsAccordionSection *)section
{    
    return [_dataMapping objectForKey:[NSValue valueWithPointer:CFBridgingRetain(section)]];
}

@end
