//
// Created by Dani Postigo on 3/3/14.
//

#import <Foundation/Foundation.h>
#import <DPKit-Styles/DPKitDrawing.h>

@interface DPKitTextFieldCell : NSTextFieldCell {
    DPKitTextFieldCellDrawingBlock cellDrawingBlock;
    NSEdgeInsets insets;
}

@property(nonatomic, copy) DPKitTextFieldCellDrawingBlock cellDrawingBlock;
@property(nonatomic) NSEdgeInsets insets;
@end