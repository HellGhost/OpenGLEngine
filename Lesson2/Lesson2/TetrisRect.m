//
//  TetrisRect.m
//  Lesson2
//
//  Created by Hell_Ghost on 19.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "TetrisRect.h"

@implementation TetrisRect
- (instancetype)init
{
    self = [super initSize:CGSizeMake(RECT_SIZE, RECT_SIZE)];
    if (self) {
        HGBorder *border = [[HGBorder alloc] initSize:self.size];
        [self addObject:border];
        border.color = color4(0, 0, 0, 1);
    }
    return self;
}
@end
