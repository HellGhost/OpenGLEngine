//
//  HGRectangle.m
//  Lesson2
//
//  Created by Hell Ghost on 17.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGRectangle.h"

@implementation HGRectangle

- (instancetype)initSize:(CGSize)size
{
    self = [super init];
    if (self) {
		self.drawType = HG_TRIANGLE_STRIP;
		[self setSize:size];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.drawType = HG_TRIANGLE_STRIP;
    }
    return self;
}

- (void)setSize:(CGSize)size {
	[super setSize:size];
	CGSize half = CGSizeMake(size.width/2, size.height/2);
	[self clearMash];
	[self setNewPoint:Vector3dMake(-half.width, half.height, 0) normal:Vector3dZero() textureCoord:TextureCoord2dZero() color:self.color];
	[self setNewPoint:Vector3dMake(-half.width, -half.height, 0) normal:Vector3dZero() textureCoord:TextureCoord2dZero() color:self.color];
	[self setNewPoint:Vector3dMake(half.width, half.height, 0) normal:Vector3dZero() textureCoord:TextureCoord2dZero() color:self.color];
	[self setNewPoint:Vector3dMake(half.width, -half.height, 0) normal:Vector3dZero() textureCoord:TextureCoord2dZero() color:self.color];
	[self addIndex:0];
	[self addIndex:1];
	[self addIndex:2];
	[self addIndex:3];
}
@end
