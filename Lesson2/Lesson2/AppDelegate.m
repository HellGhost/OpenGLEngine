//
//  AppDelegate.m
//  Lesson2
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "AppDelegate.h"
#import "HGOpenGLView.h"
#import "Tetris.h"
@implementation AppDelegate
@synthesize window;
@synthesize view;

-(id)init
{
    if(self = [super init]) {
        NSRect contentSize = NSMakeRect(200.0, 200.0, 500.0, 500.0);
        NSUInteger windowStyleMask = NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSClosableWindowMask;
        
        window = [[NSWindow alloc] initWithContentRect:contentSize styleMask:windowStyleMask backing:NSBackingStoreBuffered defer:YES];
        window.backgroundColor = [NSColor whiteColor];
        window.title = @"Lesson2";
        [window makeFirstResponder:view];
        // Create a view
        view = [[HGOpenGLView alloc] init];
        
        Tetris *tetrisScene = [[Tetris alloc] init];
        [[HGNavigationController sharedController] pushScene:tetrisScene];
    }
    return self;
}

-(void)applicationWillFinishLaunching:(NSNotification *)notification
{
    [window setContentView:view];           // Hook the view up to the window
}

-(void)applicationDidFinishLaunching:(NSNotification *)notification
{
    [window makeKeyAndOrderFront:self];     // Show the window
}

@end
