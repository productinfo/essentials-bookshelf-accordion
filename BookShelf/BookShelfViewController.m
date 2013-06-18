//
//  BookShelfViewController.m
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

#import "BookShelfViewController.h"
#import "BookShelfDataSource.h"

#define SHELF_HEIGHT 75

@interface BookShelfViewController ()

@property SEssentialsAccordion *accordion;
@property BookShelfArchive *archive;
@property BookShelfDataSource *dataSource;

@end

@implementation BookShelfViewController

- (id)init
{
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{    
    // Set up shelf background image view
    UIImageView *shelfBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                                 0,
                                                                                 self.view.bounds.size.height,
                                                                                 self.view.bounds.size.width - SHELF_HEIGHT)];
    // Image from http://openclipart.org/detail/76435/wood-texture-by-shokunin
    shelfBackground.image = [UIImage imageNamed:@"wood_texture.png"];
    [self.view addSubview:shelfBackground];
    
    // Set up accordion
    _accordion = [[SEssentialsAccordion alloc] initWithFrame:CGRectMake(0,
                                                                        0,
                                                                        self.view.bounds.size.height - 100,
                                                                        self.view.bounds.size.width)];
    // Rotates moves accordionm into position
    CGAffineTransform rotate = CGAffineTransformMakeRotation(0 - (M_PI / 2));
    CGAffineTransform translate = CGAffineTransformMakeTranslation(-88, -88);
    _accordion.transform = CGAffineTransformConcat(translate, rotate);
    
    // Set up accordions datasource
    _archive = [[BookShelfArchive alloc] init];
    _dataSource = [[BookShelfDataSource alloc] initWithBookShelfArchive:_archive];
    _accordion.dataSource = _dataSource;
    [_accordion addSectionsFromArray:[_dataSource sections]];
    
    _accordion.delegate = self;
    [_accordion setType:SEssentialsAccordionTypeFlexible];
    [[_accordion layer] setBorderWidth:2];
    [self.view addSubview:_accordion];
    
    // Set up shelf image view
    UIImageView *shelf = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                       self.view.bounds.size.width - SHELF_HEIGHT,
                                                                       self.view.bounds.size.height,
                                                                       SHELF_HEIGHT)];
    shelf.image = [UIImage imageNamed:@"wood_texture.png"];
    [self.view addSubview:shelf];
}

// Implemented so only one section is open at a time
- (void)accordion:(SEssentialsAccordion *)accordion willOpenSection:(SEssentialsAccordionSection *)section {
    for(int i =0; i<[_accordion sections].count;i++){
        SEssentialsAccordionSection * section = [_accordion sections][i];
        if(section.open){
            [section setOpen:NO];
            i = [_accordion sections].count;
        }
    }
}

@end
