//
//  HGPoint.m
//  Lesson2
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGObject.h"
@interface HGObject() {
	GLuint *indexes;
	Vector3d *vertexes;
	Vector3d *normals;
	Color4f *colors;
	TextureCoord2d *textureCoordinates;
}
@end

@implementation HGObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        child = [[NSMutableArray alloc] init];
        self.pointSize = 1;
        self.position = v3d(0, 0, 0);
        self.color = Color4fMake(1, 1, 1, 1);
		self.rotation = Vector3dZero();
        [self setScaleXYZ:1.f];
    }
    return self;
}

- (void)addObject:(HGObject*)object {
    if (object != nil && [child indexOfObject:object] == NSNotFound) {
        object.parent = self;
        [child addObject:object];
    }
}

- (NSArray*)allChild {
    return [NSArray arrayWithArray:child];
}

#pragma mark - Rotation -

- (void)setRotation:(Vector3d)rotation {
    _rotation.x = DEGREES_TO_RADIANS(rotation.x);
    _rotation.y = DEGREES_TO_RADIANS(rotation.y);
    _rotation.z = DEGREES_TO_RADIANS(rotation.z);
}

- (void)setRotateX:(float)rotateX {
	_rotation.x = rotateX;
}

- (void)setRotateY:(float)rotateY {
	_rotation.y = rotateY;
}

- (void)setRotateZ:(float)rotateZ {
	_rotation.z = rotateZ;
}

- (void)setColor:(Color4f)color {
	_color = color;
		for (int i = 0; i < _vertexCount; i++) {
			colors[i].a = _color.a;
			colors[i].r = _color.r;
			colors[i].g = _color.g;
			colors[i].b = _color.b;
        }
//        @synchronized (child) {
//            for (HGObject *c in child) {
//                [c setColor:color];
//            }
//        }
}

#pragma mark - Scale -
- (void)setScaleXYZ:(float)scaleXYZ {
    self.scale = v3d(scaleXYZ, scaleXYZ, scaleXYZ);
    _scaleXYZ = scaleXYZ;
}

- (float)rotateX {
	return _rotation.x;
}

- (float)rotateY {
	return _rotation.y;
}

- (float)rotateZ {
	return _rotation.z;
}
#pragma mark - Mesh -

#pragma mark - Object setters - 

- (void)addIndex:(GLuint)index {
	NSMutableArray *buffIndex = [[NSMutableArray alloc] init];
	for (int i = 0; i<_indexCount; i++) {
		[buffIndex addObject:@(indexes[i])];
	}
	[buffIndex addObject:@(index)];
	
	if (indexes) {
		free(indexes);
		indexes = NULL;
	}
	
	_indexCount = (GLuint)buffIndex.count;
	
	indexes = malloc(sizeof(GLuint)*buffIndex.count);
	for (int i = 0; i<buffIndex.count; i++) {
		indexes[i] = [[buffIndex objectAtIndex:i] unsignedIntValue];
	}
}

- (GLuint)addVertex:(Vector3d)vertex {
	NSMutableArray *bufferVertex = [[NSMutableArray alloc] init];
	for (int i = 0; i<_vertexCount; i++) {
		Vector3d old = vertexes[i];
		[bufferVertex addObject:@{@"x": @(old.x),@"y": @(old.y),@"z": @(old.z)}];
	}
	
	[bufferVertex addObject:@{@"x": @(vertex.x),@"y": @(vertex.y),@"z": @(vertex.z)}];
	
	if (vertexes) {
		free(vertexes);
		vertexes = NULL;
	}
	
	vertexes =  malloc(sizeof(Vector3d)*bufferVertex.count);
	
	for (int i = 0; i<bufferVertex.count; i++) {
		NSDictionary *data = [bufferVertex objectAtIndex:i];
		vertexes[i] = Vector3dMake([[data valueForKey:@"x"] floatValue], [[data valueForKey:@"y"] floatValue], [[data valueForKey:@"z"] floatValue]);
	}
	return (GLuint)bufferVertex.count;
}

- (void)addTextCoord:(TextureCoord2d)textCoord {
	
	NSMutableArray *bufferTextCoord = [[NSMutableArray alloc] init];
	for (int i = 0; i<_vertexCount; i++) {
		TextureCoord2d old = textureCoordinates[i];
		[bufferTextCoord addObject:@{@"u": @(old.u),@"v": @(old.v)}];
	}
	[bufferTextCoord addObject:@{@"u": @(textCoord.u),@"v": @(textCoord.v)}];
	
	if (textureCoordinates) {
		free(textureCoordinates);
		textureCoordinates = NULL;
	}
	textureCoordinates =  malloc(sizeof(TextureCoord2d)*bufferTextCoord.count);
	
	for (int i = 0; i<bufferTextCoord.count; i++) {
		NSDictionary *data = [bufferTextCoord objectAtIndex:i];
		textureCoordinates[i] = TextureCoord2dMake([[data valueForKey:@"u"] floatValue], [[data valueForKey:@"v"] floatValue]);
	}
}

- (void)addNormal:(Vector3d)normal {
	NSMutableArray *bufferNormal = [[NSMutableArray alloc] init];
	for (int i = 0; i<_vertexCount; i++) {
		Vector3d old = normals[i];
		[bufferNormal addObject:@{@"x": @(old.x),@"y": @(old.y),@"z": @(old.z)}];
	}
	[bufferNormal addObject:@{@"x": @(normal.x),@"y": @(normal.y),@"z": @(normal.z)}];
	
	if (normals) {
		free(normals);
		normals = NULL;
	}
	
	normals =  malloc(sizeof(Vector3d)*bufferNormal.count);
	
	for (int i = 0; i<bufferNormal.count; i++) {
		NSDictionary *data = [bufferNormal objectAtIndex:i];
		normals[i] = Vector3dMake([[data valueForKey:@"x"] floatValue], [[data valueForKey:@"y"] floatValue], [[data valueForKey:@"z"] floatValue]);
	}
}

- (void)addColor:(Color4f)color {
	NSMutableArray *bufferColor = [[NSMutableArray alloc] init];
	for (int i = 0; i<_vertexCount; i++) {
		Color4f old = colors[i];
		[bufferColor addObject:@{@"r": @(old.r), @"g": @(old.g), @"b": @(old.b), @"a": @(old.a)}];
	}
	[bufferColor addObject:@{@"r": @(color.r), @"g": @(color.g), @"b": @(color.b), @"a": @(color.a)}];

	if (colors) {
		free(colors);
		colors = NULL;
	}
	
	colors =  malloc(sizeof(Color4f)*bufferColor.count);
	
	for (int i = 0; i<bufferColor.count; i++) {
		NSDictionary *data = [bufferColor objectAtIndex:i];
		colors[i] = color4([[data valueForKey:@"r"] floatValue], [[data valueForKey:@"g"] floatValue], [[data valueForKey:@"b"] floatValue],[[data valueForKey:@"a"] floatValue]);
	}
}

#pragma mark - Object getters -

- (Vector3d*)getVertexes {
	return vertexes;
}

- (Vector3d*)getNormals {
	return normals;
}

- (GLuint*)getIndexesData {
	return indexes;
}

- (TextureCoord2d*)getTextureCoordinates {
	return textureCoordinates;
}

- (Color4f*)getColors {
	return colors;
}

- (void)setNewPoint:(Vector3d)point normal:(Vector3d)normal textureCoord:(TextureCoord2d)textCoord color:(Color4f)color {
	GLuint newCount = [self addVertex:point];
	[self addNormal:normal];
	[self addTextCoord:textCoord];
	[self addColor:color];
	_vertexCount = newCount;
}

- (void)clearMash {
	if (vertexes) {
		free(vertexes);
		vertexes = NULL;
	}
	if (colors) {
		free(colors);
		colors = NULL;
	}
	if (textureCoordinates) {
		free(textureCoordinates);
		textureCoordinates = NULL;
	}
	if (normals) {
		free(normals);
		normals = NULL;
	}
	if (indexes) {
		free(indexes);
		indexes = NULL;
	}
	_vertexCount = 0;
	_indexCount = 0;
}

- (void)dealloc
{
	[self clearMash];
}
@end
