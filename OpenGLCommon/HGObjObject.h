//
//  HGObjObject.h
//  Lesson2
//
//  Created by Hell Ghost on 18.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HGObject.h"

@interface HGObjObject : NSObject {
	
}
@property (nonatomic, readonly) NSString *materialName;
@property (nonatomic, readonly) NSString *objectName;
@property (nonatomic, readonly) int smoothing;

- (void)addFaces:(NSArray*)face;
- (void)addMaterialName:(NSString*)matName;
- (void)addObjectName:(NSString*)objName;
- (void)addSmoothing:(NSString*)smoothLevel;
- (HGObject*)makeDrawebleObjectVertices:(NSArray*)vertices textCoord:(NSArray*)textureCoordinates normals:(NSArray*)normals;
@end
