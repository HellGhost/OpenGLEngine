//
//  HGMaterial.m
//  Lesson2
//
//  Created by Hell_Ghost on 18.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//
// http://paulbourke.net/dataformats/mtl/ 

#import "HGMaterial.h"

@implementation HGMaterial
- (instancetype)init
{
    self = [super init];
    if (self) {
    
        self.ambient = color4(1, 1, 1,1);
        self.diffuse = color4(1, 1, 1, 1);
        self.specular = color4(0, 0, 0, 1);
        self.transparence = 1.f;
        self.opticalDensity = 1.f;
    }
    return self;
}
@end
