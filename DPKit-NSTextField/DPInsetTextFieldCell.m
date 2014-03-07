//
// Created by Dani Postigo on 2/1/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import "DPInsetTextFieldCell.h"
#import "NSCell+DPKit.h"

@implementation DPInsetTextFieldCell

@synthesize insets;
@synthesize debugMode;
@synthesize borderColor;

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self setup];

    }

    return self;
}

- (void) setup {
    self.bezelStyle = NSTextFieldSquareBezel;
    self.focusRingType = NSFocusRingTypeNone;
    insets = NSEdgeInsetsMake(0, 0, 0, 0);
    //    debugMode = YES;
}


- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawWithFrame: cellFrame inView: controlView];

    [self eraseBorder];

    if (debugMode) {
        [self drawDrawingRect];
        [self drawControlBounds];
        [self drawTitleRect];
        //        [self drawDebugRect: [self titleRectForBounds: cellFrame] color: [NSColor greenColor]];
    }
}

- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawInteriorWithFrame: cellFrame inView: controlView];

    [self eraseBorder];

    if (debugMode) {
        [self drawDrawingRect];
        [self drawControlBounds];
        [self drawTitleRect];
        //        [self drawDebugRect: [self titleRectForBounds: cellFrame] color: [NSColor greenColor]];
    }
}


- (void) drawBottomLine {

    NSRect bounds = self.controlView.bounds;

    NSRect lineRect = NSMakeRect(0, bounds.size.height - 1, bounds.size.width, 1);
    lineRect = [self titleRectForBounds: self.controlView.bounds];
    //    lineRect.size.height = 1;
    //    lineRect.origin.y = bounds.size.height -1;
    [[NSColor blueColor] set];
    NSRectFillUsingOperation(lineRect, NSCompositePlusDarker);

}


- (void) eraseBorder {
    [[NSColor clearColor] set];
    NSFrameRectWithWidthUsingOperation(self.controlBounds, 1, NSCompositeSourceOut);
}


- (void) drawDebugRect: (NSRect) rect color: (NSColor *) color {
    [color set];
    NSFrameRectWithWidthUsingOperation(rect, 1, NSCompositeSourceOver);

}

- (void) drawTitleRect {
    NSRect bounds = self.controlView.bounds;

    [[NSColor blueColor] set];
    NSFrameRectWithWidthUsingOperation([self titleRectForBounds: bounds], 1, NSCompositeSourceOver);

}

- (void) drawDrawingRect {
    [self drawDebugRect: [self drawingRectForBounds: self.controlBounds] color: [NSColor redColor]];
}

- (void) drawControlBounds {
    [self drawDebugRect: self.controlBounds color: [[NSColor redColor] colorWithAlphaComponent: 0.5]];
}


/* Position of the text */

- (NSRect) drawingRectForBounds: (NSRect) theRect {
    NSRect ret = [super drawingRectForBounds: theRect];
    ret.origin.x += insets.left;
    ret.origin.y += insets.top;
    ret.size.width -= (insets.right + insets.left);
    ret.size.height -= (insets.top + insets.bottom);
    return ret;
}

//
//- (NSRect) titleRectForBounds: (NSRect) theRect {
////    NSRect ret = [super titleRectForBounds: theRect];
////    //    ret.origin.y = 20;
////    ret = NSInsetRect(ret, 10, 10);
////    //    NSLog(@"ret = %@", NSStringFromRect(ret));
////    return ret;
//}



- (NSSize) cellSizeForBounds: (NSRect) aRect {
    NSSize ret = [super cellSizeForBounds: aRect];
    ret.width += insets.left + insets.right;
    ret.height += insets.top + insets.bottom;
    return ret;
}


#pragma mark Getters

- (NSColor *) borderColor {
    if (borderColor == nil) {
        borderColor = [NSColor clearColor];
    }
    return borderColor;
}

@end