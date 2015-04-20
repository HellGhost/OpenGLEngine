//
//  HGRenderOneX.h
//  Lesson2
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGL/gl.h>
#import "HGMath.h"

@interface HGRenderOneX : NSObject {
 
}
@property (nonatomic, assign) CGSize screenSize;

- (void)setTimeUpdate:(NSTimeInterval)time;
@end
