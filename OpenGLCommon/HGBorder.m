//
//  HGBorder.m
//  Lesson2
//
//  Created by Hell Ghost on 17.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGBorder.h"

@implementation HGBorder

- (instancetype)initSize:(CGSize)size
{
    self = [super init];
    if (self) {
		self.drawType = HG_LINE_LOOP;
		[self setSize:size];
    }
    return self;
}

- (void)setSize:(CGSize)size {
	[super setSize:size];
	CGSize half = CGSizeMake(size.width/2, size.height/2);
	[self clearMash];
//	MeshPoint mp = MeshPointZero();
//	mp.coordinates = Vector3dMake(-half.width, -half.height, 0);
//	mp.color = self.color;
//	[self addMeshDataObject:mp];
//	mp = MeshPointZero();
//	mp.coordinates = Vector3dMake(-half.width, half.height, 0);
//	mp.color = self.color;
//	[self addMeshDataObject:mp];
//	mp = MeshPointZero();
//	mp.coordinates = Vector3dMake(half.width, half.height, 0);
//	mp.color = self.color;
//	[self addMeshDataObject:mp];
//	mp.coordinates = Vector3dMake(half.width, -half.height, 0);
//	mp.color = self.color;
//	[self addMeshDataObject:mp];
}

@end
