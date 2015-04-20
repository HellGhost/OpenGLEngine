//
//  Vectors.h
//  Lesson1
//
//  Created by Hell Ghost on 08.07.14.
//  Copyright (c) 2014 Vladyslav Yerofeev. All rights reserved.
//
#import "HGBaseType.h"
#import "HGMacros.h"

HG_INLINE float vectorsScalar(Vector3d a, Vector3d b) {
	return a.x * b.x + a.y*b.y + a.z*b.z;
}

HG_INLINE float vectorModule(Vector3d vector) {
	return sqrtf(pow2(vector.x)+pow2(vector.y)+pow2(vector.z));
}

HG_INLINE float vectorsAngle(Vector3d a, Vector3d b) {
	float scalar = vectorsScalar(a, b);
	float aModule = vectorModule(a);
	float bModule = vectorModule(b);
	return scalar/(aModule*bModule);
}

HG_INLINE float vectorProjection(Vector3d a, Vector3d b) {
	float scalar = vectorsScalar(a, b);
	float bModule = vectorModule(b);
	return scalar/bModule;
}


HG_INLINE Vector3d vectorsAdd(Vector3d a, Vector3d b) {
	Vector3d vector;
	vector.x = b.x + a.x;
	vector.y = b.y + a.y;
	vector.z = b.z + a.z;
	return vector;
}

HG_INLINE Vector3d vectorsSubtract(Vector3d a, Vector3d b) {
	Vector3d vector;
	vector.x = a.x - b.x;
	vector.y = a.y - b.y;
	vector.z = a.z - b.z;
	return vector;
}

HG_INLINE float vectorXDirection(Vector3d vector) {
	float module = vectorModule(vector);
	return vector.x/module;
}

HG_INLINE float vectorYDirection(Vector3d vector) {
	float module = vectorModule(vector);
	return vector.y/module;
}

HG_INLINE float vectorZDirection(Vector3d vector) {
	float module = vectorModule(vector);
	return vector.z/module;
}
