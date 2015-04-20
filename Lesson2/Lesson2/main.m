//
//  main.m
//  Lesson2
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        [NSApplication sharedApplication];
        
        AppDelegate *appDelegate = [[AppDelegate alloc] init];
        [NSApp setDelegate:appDelegate];
        [NSApp run];

    };
    return 0;
}
