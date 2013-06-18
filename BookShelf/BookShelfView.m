//
//  BookShelfView.m
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

#import "BookShelfView.h"

#import <QuartzCore/QuartzCore.h>

#define PADDING 10

@implementation BookShelfView {
    Book *_book;
    
    UILabel *_titleLabel;
    UIImageView *_logoImageView;
    UILabel *_authorLabel;
    UILabel *_blurbLabel;
}

- (id)initWithFrame:(CGRect)frame withBook:(Book *)book
{
    self = [super initWithFrame:frame];
    if (self) {
        _book = book;
        [self setupView];
        
        // Rotate and translate view into position
        CGAffineTransform rotate = CGAffineTransformMakeRotation(M_PI / 2);
        CGAffineTransform translate = CGAffineTransformMakeTranslation(0, -145);
        self.transform = CGAffineTransformConcat(translate, rotate);
    }
    return self;
}

-(void) setupView {
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50,
                                                           3*PADDING,
                                                           self.frame.size.width - 100,
                                                           100)];
    [_titleLabel setText:_book.title];
    [_titleLabel setNumberOfLines:0];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setFont:[UIFont fontWithName:@"GillSans" size:30]];
    [self addSubview:_titleLabel];
    
    _authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(50,
                                                             self.frame.size.height - (100 + (3 * PADDING)),
                                                             self.frame.size.width - 100,
                                                             100)];
    [_authorLabel setText:[@"Written by " stringByAppendingString: _book.author]];
    [_authorLabel setTextAlignment:NSTextAlignmentCenter];
    [_authorLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_authorLabel];
    
    _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - 80) / 2,
                                                                   _authorLabel.frame.origin.y - (80 + PADDING),
                                                                   80,
                                                                   80)];
    _logoImageView.image = _book.publisherLogo;
    [self addSubview:_logoImageView];
    
    _blurbLabel = [[UILabel alloc] initWithFrame:CGRectMake(50,
                                                             CGRectGetMaxY(_titleLabel.frame) + (3 * PADDING),
                                                             self.frame.size.width - 100,
                                                             _logoImageView.frame.origin.y - (CGRectGetMaxY(_titleLabel.frame) + (6 * PADDING)))];
    [_blurbLabel setText:_book.blurb];
    [_blurbLabel setNumberOfLines:0];
    [_blurbLabel setTextAlignment:NSTextAlignmentCenter];
    [_blurbLabel setBackgroundColor:[UIColor clearColor]];
    [_blurbLabel setFont:[UIFont fontWithName:@"GillSans" size:20]];
    [self addSubview:_blurbLabel];
}
@end
