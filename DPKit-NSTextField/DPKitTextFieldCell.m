//
// Created by Dani Postigo on 3/3/14.
//

#import "DPKitTextFieldCell.h"
#import "NSCell+DPKit.h"

@implementation DPKitTextFieldCell

@synthesize cellDrawingBlock;

@synthesize insets;

- (void) awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void) setup {
    self.bezelStyle = NSTextFieldSquareBezel;
    self.focusRingType = NSFocusRingTypeNone;
}

- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {

    if (cellDrawingBlock) {
        cellDrawingBlock(self, cellFrame);

        NSRect backgroundRect = cellFrame;
        backgroundRect.size.height -= 1.f;

        NSSize textSize = [self cellSizeForBounds: cellFrame];

        CGFloat textY = NSMidY(backgroundRect) - (textSize.height / 2.0) - 1.0;
        NSRect textRect = NSMakeRect(backgroundRect.origin.x, textY, backgroundRect.size.width, textSize.height);

        //        textRect.origin.x += insets.left;
        //        textRect.origin.y += insets.top;
        [self drawInteriorWithFrame: cellFrame inView: controlView];

    } else {
        [super drawWithFrame: cellFrame inView: controlView];
    }
}


- (NSRect) drawingRectForBounds: (NSRect) theRect {
    NSRect ret = [super drawingRectForBounds: theRect];
    ret.origin.x += insets.left;
    ret.origin.y += insets.top;
    ret.size.width -= (insets.right + insets.left);
    ret.size.height -= (insets.top + insets.bottom);
    return ret;
}

- (NSSize) cellSizeForBounds: (NSRect) aRect {
    NSSize ret = [super cellSizeForBounds: aRect];
    ret.width += insets.left + insets.right;
    ret.height += insets.top + insets.bottom;
    return ret;
}


@end