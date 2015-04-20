//
//  AppDelegate.h
//  Lesson2
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "HGOpenGLView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (retain) NSWindow *window;
@property (retain) HGOpenGLView *view;

@end
