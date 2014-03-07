//
// Created by Dani Postigo on 2/1/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "DPUnderlineTextFieldCell.h"
#import "NSCell+DPKit.h"

@implementation DPUnderlineTextFieldCell

- (void) setup {
    [super setup];
    insets = NSEdgeInsetsMake(0, 0, 0, 0);
    self.borderColor = [NSColor colorWithDeviceWhite: 0.0 alpha: 0.1];

}

- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawInteriorWithFrame: cellFrame inView: controlView];

    NSRect lineRect = [self titleRectForBounds: self.controlBounds];
    lineRect.size.height = 1;
    lineRect.origin.y = self.controlBounds.size.height - 1;
    [self.borderColor set];
    NSRectFillUsingOperation(self.underlineRect, NSCompositeSourceOver);
}

- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawWithFrame: cellFrame inView: controlView];

    [self.borderColor set];
    NSRectFillUsingOperation(self.underlineRect, NSCompositeSourceOver);
}


- (NSRect) underlineRect {
    NSRect lineRect = [self titleRectForBounds: self.controlBounds];
    lineRect.size.height = 1;
    lineRect.origin.y = self.controlBounds.size.height - 1;
    lineRect.origin.x += 1.5;
    return lineRect;

}

@end