//
//  Tetris.m
//  Lesson2
//
//  Created by Hell_Ghost on 15.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "Tetris.h"
#import "HGRectangle.h"
#import "TetrisRect.h"
#define updateTime .1
#define FIELD_SIZE CGSizeMake(1.25, 1.75)
@implementation Tetris

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.color = Color4fMake(0.5, 0.5, 0.5, 1);
//		HGObjModel *model = [[HGObjModel alloc] initWithName:@"cube.obj"];
//		[self addObject:model];
//		[self performSelector:@selector(tick:) withObject:model afterDelay:updateTime];
		

        fabric = [[TetrisFabric alloc] init];
		HGMaterial *material = [[HGMaterial alloc] init];
		material.diffuse = color4(1, 0, 0, 1);
		material.specular = color4(1, 0, 0, 1);
        fieldData = @"";
		
		for (int i = 0; i < 35; i++) {
			for (int j = 0; j < 25; j++) {
				HGBorder * border = [[HGBorder alloc] initSize:CGSizeMake(RECT_SIZE, RECT_SIZE)];
				border.position = v3d(-FIELD_SIZE.width/2+RECT_SIZE/2+RECT_SIZE*j, FIELD_SIZE.height/2-RECT_SIZE/2-RECT_SIZE*i, 0);
				[self addObject:border];
				border.color = color4(1, 1, 0, 1);
				fieldData  = [NSString stringWithFormat:@"%@%d",fieldData,0];
			}
			fieldData  = [NSString stringWithFormat:@"%@,",fieldData];
		}
		
		HGBorder *border = [[HGBorder alloc] initSize:FIELD_SIZE];
		border.color = color4(0, 0, 0, 1);
		[self addObject:border];

		TetrisFigure *rect = [fabric figurewithIndex:1];
		rect.material = material;
        [self addObject:rect];
        [self performSelector:@selector(tick:) withObject:rect afterDelay:updateTime];
    }
    return self;
}

- (void)tick:(HGObjModel*)rect {
	rect.rotateZ += 10;
//    [rect rotate];
	rect.color = color4((arc4random()%100)/100.f, (arc4random()%100)/100.f, (arc4random()%100)/100.f, 1);
	[self performSelector:@selector(tick:) withObject:rect afterDelay:updateTime];
}
@end
