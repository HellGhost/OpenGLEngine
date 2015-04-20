//
//  HGRenderOneX
//  Lesson2
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGRenderOneX.h"
#import "HGNavigationController.h"

#define DRAW_ELEMENTS 1
#define LINE_DEBUG 0

@implementation HGRenderOneX
@synthesize screenSize;

- (instancetype)init
{
    self = [super init];
    if (self) {
      	
    }
    return self;
}

- (void)setTimeUpdate:(NSTimeInterval)time {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(update:) object:nil];
    [NSTimer scheduledTimerWithTimeInterval:time
                                     target:self
                                   selector:@selector(update:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)update:(NSTimeInterval)time {
    HGScene *scene = [[HGNavigationController sharedController] visibleScene];
    
    
    if (scene) {
        glClearColor(scene.color.r, scene.color.g, scene.color.b, scene.color.a);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        glPushMatrix();
        glEnable(GL_DEPTH_TEST);
        glMatrixMode(GL_PROJECTION);
		glEnable(GL_CULL_FACE);
#if LINE_DEBUG
		glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
#endif
        glLoadIdentity();
        glViewport(0, 0, screenSize.width,  screenSize.height);
        float aspect =  screenSize.width/screenSize.height;
        
        glOrtho(-1.f*aspect, 1.f*aspect, -1, 1, -100, 100);
        glPushMatrix();
        for (HGObject *obj in [scene allChild]) {
            [self recursiveDraw:obj];
        }
        glPopMatrix();
        glPopMatrix();
        glFlush();
    }
}

- (void)recursiveDraw:(HGObject*)object {
    glPushMatrix();
    [self drawObject:object];
    for (HGObject *obj in [object allChild]) {
        [self recursiveDraw:obj];
    }
     glPopMatrix();
}

#if DRAW_ELEMENTS
- (void)drawObject:(HGObject*)object {
    glMatrixMode(GL_MODELVIEW);
    glRotatef(object.rotation.x, 1, 0, 0);
    glRotatef(object.rotation.y, 0, 1, 0);
    glRotatef(object.rotation.z, 0, 0, 1);
    glScalef(object.scale.x, object.scale.y, object.scale.z);
    glTranslatef(object.position.x, object.position.y, object.position.z);
    glPointSize(object.pointSize);
	
	if (object.material) {
		glEnable(GL_LIGHTING);
		glColorMaterial ( GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE );
		glDisable(GL_COLOR_MATERIAL);
		glEnable(GL_LIGHT0);
		glShadeModel(GL_SMOOTH);
		float data[3];
		data[0] = object.material.ambient.r;
		data[1] = object.material.ambient.g;
		data[2] = object.material.ambient.b;
		glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, data);
		data[0] = object.material.diffuse.r;
		data[1] = object.material.diffuse.g;
		data[2] = object.material.diffuse.b;
		glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, data);
		
		data[0] = object.material.specular.r;
		data[1] = object.material.specular.g;
		data[2] = object.material.specular.b;
		glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, data);
		
		glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, object.material.specularRange);
		//		data[0] = 0;
		//		data[1] = 1;
		//		data[2] = 1;
		//		glLightfv(GL_LIGHT0, GL_AMBIENT, data);
	}

    if (object.drawType != HG_NONE) {
		glEnableClientState(GL_VERTEX_ARRAY);
		glEnableClientState(GL_COLOR_ARRAY);
		glEnableClientState(GL_TEXTURE_COORD_ARRAY);
		glEnableClientState(GL_NORMAL_ARRAY);
		
		glVertexPointer(3, GL_FLOAT, 0, &[object getVertexes][0]);
		glColorPointer(4, GL_FLOAT, 0, &[object getColors][0]);
		glTexCoordPointer(2, GL_FLOAT, 0, &[object getTextureCoordinates][0]);
		glNormalPointer(GL_FLOAT, 0, &[object getNormals][0]);
		
		glDrawElements(object.drawType, object.indexCount, GL_UNSIGNED_INT, [object getIndexesData]);

		glDisableClientState(GL_VERTEX_ARRAY);
		glDisableClientState(GL_COLOR_ARRAY);
		glDisableClientState(GL_TEXTURE_COORD_ARRAY);
		glDisableClientState(GL_NORMAL_ARRAY);
    }
}

#else
- (void)drawObject:(HGObject*)object {
    glMatrixMode(GL_MODELVIEW);
    glRotatef(object.rotation.x, 1, 0, 0);
    glRotatef(object.rotation.y, 0, 1, 0);
    glRotatef(object.rotation.z, 0, 0, 1);
    glScalef(object.scale.x, object.scale.y, object.scale.z);
    glTranslatef(object.position.x, object.position.y, object.position.z);
    glPointSize(object.pointSize);
	
	if (object.material) {
		glEnable(GL_LIGHTING);
		glColorMaterial ( GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE );
		glDisable(GL_COLOR_MATERIAL);
		glEnable(GL_LIGHT0);
		glShadeModel(GL_SMOOTH);
		float data[3];
		data[0] = object.material.ambient.r;
		data[1] = object.material.ambient.g;
		data[2] = object.material.ambient.b;
		glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, data);
		data[0] = object.material.diffuse.r;
		data[1] = object.material.diffuse.g;
		data[2] = object.material.diffuse.b;
		glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, data);
		
		data[0] = object.material.specular.r;
		data[1] = object.material.specular.g;
		data[2] = object.material.specular.b;
		glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, data);
		
		glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, object.material.specularRange);
		//		data[0] = 0;
		//		data[1] = 1;
		//		data[2] = 1;
		//		glLightfv(GL_LIGHT0, GL_AMBIENT, data);
	}
	
    if (object.drawType != HG_NONE) {
        glBegin(object.drawType); {
            for (HGMeshContainer *meshObj in object.meshData) {
                MeshPoint point = meshObj.point;
                //glColor4f(point.color.r, point.color.g, point.color.b, point.color.a);
                glVertex3f(point.coordinates.x, point.coordinates.y, point.coordinates.z);
                glNormal3f(point.normal.x, point.normal.y, point.normal.z);
                glTexCoord2f(point.textureCoordinates.u, point.textureCoordinates.v);
			}
        } glEnd();
    }
}
#endif
@end
