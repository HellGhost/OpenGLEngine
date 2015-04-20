//
//  HGObjModel.m
//  Lesson2
//
//  Created by Hell_Ghost on 17.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGObjModel.h"
#import "HGObjObject.h"
#import "HGRectangle.h"
#import "HGMaterial.h"

@interface HGObjModel (){
	NSMutableArray *vertices;
	NSMutableArray *normals;
	NSMutableArray *textureCoordinates;
    NSMutableDictionary *materials;
}
@end

@implementation HGObjModel

- (instancetype)initWithName:(NSString*)name {
  NSString *filePath = [[NSBundle mainBundle] pathForResource:[name stringByDeletingPathExtension] ofType:[name pathExtension]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:nil]) {
        return [self initWithFilePath:filePath];
	} else {
		NSAssert(0, @"File %@ not found",name);
	}
    return nil;
    
}
- (instancetype)initWithFilePath:(NSString*)filePath {
    self = [super init];
    if (self) {
		vertices = [[NSMutableArray alloc] init];
		normals = [[NSMutableArray alloc] init];
		textureCoordinates = [[NSMutableArray alloc] init];
		materials = [[NSMutableDictionary alloc] init];
        
        self.drawType = HG_NONE;
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            //Background Thread
            NSError *error = nil;
            NSString *fileData = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
            NSArray *data = [fileData componentsSeparatedByString:@"\n"];
			NSMutableArray *objectArray = [[NSMutableArray alloc] init];
			
            for (NSString *line in data) {
               NSArray *lineData = [line componentsSeparatedByString:@" "];
                if (![lineData count]) {
                    continue;
                }
                NSString *parametrType = [lineData firstObject];
                if ([parametrType isEqualToString:@"#"]) {
                    continue;
                } else if ([parametrType isEqualToString:@"mtllib"]) {
                    NSMutableArray *array = [NSMutableArray arrayWithArray:lineData];
                    [array removeObjectAtIndex:0];
                    NSString *dirPath = [filePath stringByDeletingLastPathComponent];
                    [self loadMaterials:[dirPath stringByAppendingPathComponent:[array componentsJoinedByString:@" "]]];
                    continue;
                } else if ([parametrType isEqualToString:@"o"] || [parametrType isEqualToString:@"g"]) {
					HGObjObject *newObj = [[HGObjObject alloc] init];
                    NSMutableArray *array = [NSMutableArray arrayWithArray:lineData];
                    [array removeObjectAtIndex:0];
                    [newObj addObjectName:[array componentsJoinedByString:@" "]];
                    [objectArray addObject:newObj];
                } else if ([parametrType isEqualToString:@"v"]) {
					[self addVerticeData:lineData];
                } else if ([parametrType isEqualToString:@"vt"]) {
                    [self addTextureCoordinateData:lineData];
                } else if ([parametrType isEqualToString:@"vn"]) {
					[self addNormalData:lineData];
                } else if ([parametrType isEqualToString:@"usemtl"]) {
                    NSMutableArray *array = [NSMutableArray arrayWithArray:lineData];
                    [array removeObjectAtIndex:0];
                    [[objectArray lastObject] addMaterialName:[array componentsJoinedByString:@" "]];
                    continue;
                } else if ([parametrType isEqualToString:@"f"]) {
					[[objectArray lastObject] addFaces:lineData];
                } else if ([parametrType isEqualToString:@"s"]) {
					[[objectArray lastObject] addSmoothing:[lineData lastObject]];
                }
            }
			
			for (HGObjObject *obj in objectArray) {
				HGObject *drawObj = [obj makeDrawebleObjectVertices:vertices textCoord:textureCoordinates normals:normals];
				drawObj.material = [materials valueForKey:obj.materialName];
                [self addObject:drawObj];
			}
			dispatch_async(dispatch_get_main_queue(), ^(void){
                //Run UI Updates
            });
        });
       
    }
    return self;
}
#pragma mark - Data storage - 

- (void)addVerticeData:(NSArray*)vertice {
	if ([vertice count] >= 4) {
		NSDictionary *sdata = @{@"x": [vertice objectAtIndex:1],@"y": [vertice objectAtIndex:2],@"z": [vertice objectAtIndex:3], @"i" : @(vertices.count+1)};
		[vertices addObject:sdata];
	}
}

- (void)addNormalData:(NSArray*)normal {
	if ([normal count] >= 4) {
		NSDictionary *sdata = @{@"x": [normal objectAtIndex:1],@"y": [normal objectAtIndex:2],@"z": [normal objectAtIndex:3]};
		[normals addObject:sdata];
	}
}

- (void)addTextureCoordinateData:(NSArray*)textureCoord {
	if ([textureCoord count] >= 3) {
		NSDictionary *sdata = @{@"u": [textureCoord objectAtIndex:1],@"v": [textureCoord objectAtIndex:2]};
		[textureCoordinates addObject:sdata];
	}
}


- (void)loadMaterials:(NSString*)filePath {
	 NSLog(@"%@",filePath);
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:nil]) {
        NSError *error;
        NSString *fileData = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        if (fileData && !error) {
            NSArray *data = [fileData componentsSeparatedByString:@"\n"];
            NSMutableArray *tempMaterials = [[NSMutableArray alloc] init];
            for (NSString *line in data) {
                NSArray *lineData = [line componentsSeparatedByString:@" "];
                if (![lineData count]) {
                    continue;
                }
                NSString *parametrType = [lineData firstObject];
                NSMutableArray *parametrs = [NSMutableArray arrayWithArray:lineData];
                [parametrs removeObjectAtIndex:0];
                if ([parametrType isEqualToString:@"#"]) {
                    
                } else if ([parametrType isEqualToString:@"newmtl"]) {
                    HGMaterial *newMat = [[HGMaterial alloc] init];
                    [tempMaterials addObject:newMat];
                    newMat.name = [parametrs componentsJoinedByString:@" "];
                } else  if ([parametrType isEqualToString:@"Ns"]) {
                    ((HGMaterial *)[tempMaterials lastObject]).specularRange = [[parametrs objectAtIndex:0] floatValue];
                } else  if ([parametrType isEqualToString:@"Ka"]) {
                    ((HGMaterial *)[tempMaterials lastObject]).ambient = color4([[parametrs objectAtIndex:0] floatValue], [[parametrs objectAtIndex:1] floatValue], [[parametrs objectAtIndex:2] floatValue],1);
                } else  if ([parametrType isEqualToString:@"Kd"]) {
                    ((HGMaterial *)[tempMaterials lastObject]).diffuse = color4([[parametrs objectAtIndex:0] floatValue], [[parametrs objectAtIndex:1] floatValue], [[parametrs objectAtIndex:2] floatValue],1);
                } else  if ([parametrType isEqualToString:@"Ks"]) {
                    ((HGMaterial *)[tempMaterials lastObject]).specular = color4([[parametrs objectAtIndex:0] floatValue], [[parametrs objectAtIndex:1] floatValue], [[parametrs objectAtIndex:2] floatValue],1);
                } else  if ([parametrType isEqualToString:@"Ni"]) {
                    continue;
                } else  if ([parametrType isEqualToString:@"d"] || [parametrType isEqualToString:@"Tr"]) {
                    ((HGMaterial *)[tempMaterials lastObject]).transparence = [[parametrs objectAtIndex:0] floatValue];
                } else if ([parametrType isEqualToString:@"illum"]) {
                    ((HGMaterial *)[tempMaterials lastObject]).illumination = [[parametrs objectAtIndex:0] intValue];
                } else if ([parametrType isEqualToString:@"map_Kd"]) {
                    
                }
            }
            for (HGMaterial *mat in tempMaterials) {
                [materials setValue:mat forKey:mat.name];
            }
        }
    }
}
@end
