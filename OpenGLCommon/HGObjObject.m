//
//  HGObjObject.m
//  Lesson2
//
//  Created by Hell Ghost on 18.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGObjObject.h"
@interface HGObjObject () {
	NSMutableArray *faces;
}
@end

@implementation HGObjObject
- (instancetype)init
{
    self = [super init];
    if (self) {
		faces = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addFaces:(NSArray*)face {
	for (int f = 1; f < face.count; f++) {
		[faces addObject:[face objectAtIndex:f]];
	}
}

- (void)addMaterialName:(NSString*)matName {
	_materialName = matName;
}

- (void)addObjectName:(NSString*)objName {
	_objectName = objName;
}

- (void)addSmoothing:(NSString*)smoothLevel {
	_smoothing = ([[smoothLevel lowercaseString] isEqualToString:@"off"])? 0 : [smoothLevel intValue];
}

- (HGObject*)makeDrawebleObjectVertices:(NSArray*)vertices textCoord:(NSArray*)textureCoordinates normals:(NSArray*)normals {
	HGObject *retObj = [[HGObject alloc] init];
	retObj.name = self.objectName;
	retObj.drawType = HG_LINES;
	
	for (NSString *face in faces) {
		NSArray *componentValues = [face componentsSeparatedByString:@"/"];
		float x = 0;
		float y = 0;
		float z = 0;
		
		float u = 0;
		float v = 0;
		
		float xn = 0;
		float yn = 0;
		float zn = 0;
		
		NSString *componentString = [componentValues objectAtIndex:0];
		if (![componentString isEqualToString:@""]) {
			int componentIndex = [componentString intValue];
			componentIndex -= 1;
			if (vertices.count > componentIndex) {
				NSDictionary *dic = [vertices objectAtIndex:componentIndex];
				x = [[dic valueForKey:@"x"] floatValue];
				y = [[dic valueForKey:@"y"] floatValue];
				z = [[dic valueForKey:@"z"] floatValue];
				[retObj addIndex:componentIndex];
			} else {
				NSLog(@"O_o");
			}
		}
		componentString = [componentValues objectAtIndex:1];
		if (![componentString isEqualToString:@""]) {
			int componentIndex = [componentString intValue];
			componentIndex -= 1;
			if (textureCoordinates.count > componentIndex) {
				NSDictionary *dic = [textureCoordinates objectAtIndex:componentIndex];
				u = [[dic valueForKey:@"u"] floatValue];
				v = [[dic valueForKey:@"v"] floatValue];
			} else {
				NSLog(@"O_o");
			}
		}
		
		componentString = [componentValues objectAtIndex:2];
		if (![componentString isEqualToString:@""]) {
			int componentIndex = [componentString intValue];
			componentIndex -= 1;
			if (normals.count > componentIndex) {
				NSDictionary *dic = [normals objectAtIndex:componentIndex];
				xn = [[dic valueForKey:@"x"] floatValue];
				yn = [[dic valueForKey:@"y"] floatValue];
				zn = [[dic valueForKey:@"z"] floatValue];
			} else {
				NSLog(@"O_o");
			}
		}
		[retObj setNewPoint:Vector3dMake(x, y, zn) normal:Vector3dMake(xn, yn, zn) textureCoord:TextureCoord2dMake(u, v) color:retObj.color];
	}
	return retObj;
}
@end
