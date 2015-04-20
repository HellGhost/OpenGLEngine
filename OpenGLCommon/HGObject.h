//
//  HGPoint.h
//  Lesson2
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HGMath.h"
#import "HGMaterial.h"

typedef enum{
    HG_NONE           = -0x0001,
    HG_POINTS         =  0x0000,
    HG_LINES          =  0x0001,
    HG_LINE_LOOP      =  0x0002,
    HG_LINE_STRIP     =  0x0003,
    HG_TRIANGLES      =  0x0004,
    HG_TRIANGLE_STRIP =  0x0005,
    HG_TRIANGLE_FAN   =  0x0006,
/*  HG_QUADS          =  0x0007,
    HG_QUAD_STRIP     =  0x0008,
    HG_POLYGON        =  0x0009 */
}DrawType;

@interface HGObject : NSObject {
    NSMutableArray *child;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) Vector3d position;
@property (nonatomic, assign) TextureCoord2d textCoord;
@property (nonatomic, assign) Color4f color;
@property (nonatomic, retain) HGObject *parent;
@property (nonatomic, assign) BOOL hidden;
//scale
@property (nonatomic, assign) Vector3d scale;
@property (nonatomic, assign) float scaleXYZ;
@property (nonatomic, assign) Vector3d rotation;
//! Draw type setup parent all children get him tipe
@property (nonatomic, assign) DrawType drawType;

@property (nonatomic, assign) float rotateX;
@property (nonatomic, assign) float rotateY;
@property (nonatomic, assign) float rotateZ;
@property (nonatomic, assign) float pointSize;
@property (nonatomic, retain) HGMaterial *material;

@property (nonatomic, readonly) int indexCount;
@property (nonatomic, readonly) int vertexCount;

- (void)addObject:(HGObject*)object;
- (NSArray*)allChild;
- (void)clearMash;

- (void)addIndex:(GLuint)index;

//- (GLuint)addVertex:(Vector3d)vertex;
//- (void)addTextCoord:(TextureCoord2d)textCoord;
//- (void)addNormal:(Vector3d)normal;

- (GLuint*)getIndexesData;
- (Vector3d*)getVertexes;
- (Vector3d*)getNormals;
- (TextureCoord2d*)getTextureCoordinates;
- (Color4f*)getColors;

- (void)setNewPoint:(Vector3d)point normal:(Vector3d)normal textureCoord:(TextureCoord2d)textCoord color:(Color4f)color;
@end
