//
//  HGMaterial.h
//  Lesson2
//
//  Created by Hell_Ghost on 18.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HGMath.h"

@interface HGMaterial : NSObject {
    
}
@property (nonatomic, retain) NSString *name;
//!Ka
@property (nonatomic, assign) Color4f ambient;
 //!Kd
@property (nonatomic, assign) Color4f diffuse;
//!Ks
@property (nonatomic, assign) Color4f specular;
//!Ns
@property (nonatomic, assign) float specularRange;
//!Tr
@property (nonatomic, assign) float transparence;
//!illum
@property (nonatomic, assign) int illumination;
//! Ni
@property (nonatomic, assign) float opticalDensity;
@end
