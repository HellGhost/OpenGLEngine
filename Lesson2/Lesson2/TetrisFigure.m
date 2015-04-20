//
//  TetrisFigure.m
//  Lesson2
//
//  Created by Hell_Ghost on 19.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "TetrisFigure.h"
@interface TetrisFigure() {
    
}
@end
@implementation TetrisFigure
- (instancetype)initWithMatrix:(NSString*)matrix {
    self = [super init];
    if (self) {
        _matrix = matrix;
        
        NSArray *line = [matrix componentsSeparatedByString:@","];
        float cubeSize = RECT_SIZE;
        float centerOffset = (line.count == 3)?cubeSize:(cubeSize+cubeSize/2);
        for (int l = 0; l < line.count; l++) {
            NSString *lineData = [line objectAtIndex:l];
            for (int i = 0; i<lineData.length; i++) {
                NSRange range;
                range.location = i;
                range.length = 1;
                NSString *symbol = [lineData substringWithRange:range];
                Vector3d pos = v3d(-centerOffset+cubeSize*i, -centerOffset+(cubeSize*l), 0);
                if ([symbol boolValue]) {
                    TetrisRect *cube = [[TetrisRect alloc] init];
                    cube.position = pos;
                    [self addObject:cube];
                } else {
// Figure debug
//                    HGBorder *border = [[HGBorder alloc] initSize:CGSizeMake(cubeSize, cubeSize)];
//                    border.position = pos;
//                    border.color = color4(0, 0, 0, 1);
//                    [self addObject:border];
                }
            }
        }
    }
    return self;
}

- (void)setColor:(Color4f)color {
	[super setColor:color];
	for (HGObject *obj in child) {
		obj.color = color;
	}
}

- (void)rotate {
	self.rotateZ += 90;
	NSString *temp = @"";
	
	NSArray *line = [self.matrix componentsSeparatedByString:@","];
	for (int i = 0; i < line.count; i++) {
		NSString *lineData = [line objectAtIndex:i];
		for (int j = 0; j<line.count; j++) {
			for (int k = 0; k<line.count; k++) {
				
			}
		}
//		for (int j = 0; j<lineData.length; j++) {
//			NSRange range;
//			range.location = j;
//			range.length = 1;
//			NSString *symbol = [lineData substringWithRange:range];
//			temp = [NSString stringWithFormat:@"%@%@",temp,symbol];
//		}
//		temp = [NSString stringWithFormat:@"%@,",temp];
	}
	
}
@end
