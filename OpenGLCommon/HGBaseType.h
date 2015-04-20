//
//  HGBaseType.h
//  Lesson1
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Vladyslav Yerofeev. All rights reserved.
//

#import "HGMacros.h"

#define v3d(x,y,z) Vector3dMake(x, y, z)
#define txc2d(u,v) TextureCoord2dMake(u, v)
#define color4(r, g, b, a) Color4fMake(r, g, b, a)
#define color4Byte(r, g, b, a)  Color4fMake(((float)r)/255.f, ((float)g)/255.f, ((float)b)/255.f, a)

struct Vector3d {
	GLfloat x;
	GLfloat y;
	GLfloat z;
};
typedef struct Vector3d Vector3d;

struct TextureCoord2d {
    GLfloat u;
    GLfloat v;
};
typedef struct TextureCoord2d TextureCoord2d;

struct Color4f {
    GLfloat r;
    GLfloat g;
    GLfloat b;
    GLfloat a;
};
typedef struct Color4f Color4f;

#pragma mark - Vector -

HG_INLINE Vector3d Vector3dZero() {
    Vector3d vector;
	vector.x = 0;
	vector.y = 0;
	vector.z = 0;
	return vector;
}

HG_INLINE Vector3d Vector3dMake(float x, float y, float z) {
    Vector3d vector = Vector3dZero();
	vector.x = x;
	vector.y = y;
	vector.z = z;
	return vector;
}

#pragma mark - Texture coordinates -

HG_INLINE TextureCoord2d TextureCoord2dZero() {
    TextureCoord2d textureCoord;
    textureCoord.u = 0;
    textureCoord.v = 0;
    return textureCoord;
}

HG_INLINE TextureCoord2d TextureCoord2dMake(float u, float v) {
    TextureCoord2d textureCoord = TextureCoord2dZero();
    textureCoord.u = u;
    textureCoord.v = v;
    return textureCoord;
}

#pragma mark - Color-

HG_INLINE Color4f Color4fZero() {
    Color4f color;
	color.r = 0;
    color.g = 0;
	color.b = 0;
    color.a = 1;
	return color;
}

HG_INLINE Color4f Color4fMake(float r, float g, float b, float a) {
	Color4f color;
	color.r = r;
    color.g = g;
	color.b = b;
    color.a = a;
	return color;
}

