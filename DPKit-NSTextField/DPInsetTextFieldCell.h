//
// Created by Dani Postigo on 2/1/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPInsetTextFieldCell : NSTextFieldCell {

    NSColor *borderColor;
    BOOL debugMode;
    NSEdgeInsets insets;
}

@property(nonatomic) NSEdgeInsets insets;
@property(nonatomic) BOOL debugMode;
@property(nonatomic, strong) NSColor *borderColor;
- (void) setup;
@end