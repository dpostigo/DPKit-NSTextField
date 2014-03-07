//
// Created by Dani Postigo on 3/3/14.
//

#import "NSTextField+DPKitTextFieldCell.h"
#import "DPKitTextFieldCell.h"

@implementation NSTextField (DPKitTextFieldCell)

- (DPKitTextFieldCell *) kitTextFieldCell {
    return [[self cell] isKindOfClass: [DPKitTextFieldCell class]] ? [self cell] : nil;
}
@end