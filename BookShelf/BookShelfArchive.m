//
//  BookShelfArchive.m
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

#import "BookShelfArchive.h"
#import "Book.h"

//  The BookShelfArchive class turns raw data into Book objects then
//  stores each book in an array. This array can then be accessed by the
//  BookShelfDataSource Class to extract the data needed so it can be displayed
//  on the SEssentialsAccordion.
@implementation BookShelfArchive

- (id)init {
    self = [super init];
    if (self) {
        [self setupData];
    }
    return self;
}

// Turns raw data into Book objects and adds them to the _books array
-(void)setupData {
    NSArray *titles = @[@"A Developer's Bible",
                        @"Create Your Own ShinobiChart Part I",
                        @"Create Your Own ShinobiChart Part II",
                        @"Create Your Own ShinobiChart Part III",
                        @"The Essentials for ShinobiEssentials", 
                        @"History Of Shinobi",
                        @"How To Use An Accordion",
                        @"Shinobi For Dummies",
                        @"ShinobiGrids: Reloaded",
                        @"What Really Grinds My ShinobiGrids..."];
    NSArray *authors = @[@"A.Polkinghorn",
                         @"J.Akerman",
                         @"J.Akerman",
                         @"J.Akerman",
                         @"D.Allsop",
                         @"C.Grant",
                         @"A.Polkinghorn",
                         @"D.Allsop",
                         @"R.Pilling",
                         @"R.Pilling"];
    NSArray *blurbs = @[@"A developer's must read! This book guides developers through the pitfalls that software development causes.",
                        @"An introduction to ShinobiCharts and how to create your own from scratch! A great read for beginners.",
                        @"The second book in the series that delves further into the ShinobiCharts rabbit hole. Describing what features are available and how to use these effectively.",
                        @"The final book in the series that tests your skills as a developer. Containing challenging tasks and complex implementation.",
                        @"This book is essential when implementing ShinobiEssentials. With a wide range of detailed tutorials and example code it really is a must read!",
                        @"Learn where Shinobi came from listing the incredible developers involved and where they plan on going next!",
                        @"The SEssentialsAccordion is an easy component to learn but you can get to know the ins and outs of it with this fantastic book!",
                        @"A great novel into the wonderful world that is Shinobi. With very detailed descriptions of each components it's book targeted at beginners. ",
                        @"With the new version of ShinobiGrids released lets reload the new framework and get started on the new features and changes make ShinobiGrids a great library.",
                        @"A review of ShinobiGrids where the author Rob Bartholomew Pilling takes apart grids giving his views on its implementation."];
    NSArray *publishers = @[@0,@1,@1,@1,@2,@3,@0,@2,@4,@4];
    
    _books = [[NSMutableArray alloc] init];
    
    for(int i = 0; i<titles.count; i++){
        Book *book = [Book new];
        book.title = titles[i];
        book.author = authors[i];
        book.blurb = blurbs[i];
        
        if([publishers[i] floatValue] == 0){
            // Image from http://openclipart.org/detail/21288/swan-by-babayasin-21288
            book.publisherLogo  = [UIImage imageNamed:@"publisherLogo1.png"];
            book.spineColor = [UIColor colorWithRed:70./255. green:130./255. blue:180./255. alpha:1];
            book.coverColor = [UIColor colorWithRed:135./255. green:206./255. blue:250./255. alpha:1];
        }else if([publishers[i] floatValue] == 1){
            // Image from http://openclipart.org/detail/154117/heart-ecg-logo-by-juliobahar
            book.publisherLogo  = [UIImage imageNamed:@"publisherLogo2.png"];
            book.spineColor = [UIColor colorWithRed:176./255. green:23./255. blue:31./255. alpha:1];
            book.coverColor = [UIColor colorWithRed:220./255. green:20./255. blue:60./255. alpha:1];
        }else if([publishers[i] floatValue] == 2){
            // Image from http://openclipart.org/detail/137251/ocal-logo-saffron-by-gsagri04
            book.publisherLogo  = [UIImage imageNamed:@"publisherLogo3.png"];
            book.spineColor = [UIColor colorWithRed:205./255. green:173./255. blue:0./255. alpha:1];
            book.coverColor = [UIColor colorWithRed:238./255. green:201./255. blue:0./255. alpha:1];
        }else if([publishers[i] floatValue] == 3){
            // Image from http://openclipart.org/detail/142747/odf-logo-icon-by-andy
            book.publisherLogo  = [UIImage imageNamed:@"publisherLogo4.png"];
            book.spineColor = [UIColor colorWithRed:0./255. green:100./255. blue:0./255. alpha:1];
            book.coverColor = [UIColor colorWithRed:84./255. green:139./255. blue:84./255. alpha:1];
        }else if([publishers[i] floatValue] == 4){
            // Image from http://openclipart.org/detail/177972/ladybug-ladybirds-boru%C5%BE%C4%97-by-keistutis-177972
            book.publisherLogo  = [UIImage imageNamed:@"publisherLogo5.png"];
            book.spineColor = [UIColor colorWithRed:139./255. green:69./255. blue:19./255. alpha:1];
            book.coverColor = [UIColor colorWithRed:255./255. green:130./255. blue:71./255. alpha:1];
        }
        [_books addObject:book];
    }
}

@end
