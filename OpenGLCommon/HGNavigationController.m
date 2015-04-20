//
//  HGDirector.m
//  Lesson2
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGNavigationController.h"
HGNavigationController *sharedController = nil;

@implementation HGNavigationController

@synthesize stack;

+(instancetype)sharedController {
    if (!sharedController) {
        sharedController = [[self alloc] init];
    }
    return sharedController;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        stack = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)pushScene:(HGScene*)scene {
    [stack addObject:scene];
}

- (HGScene*)visibleScene {
    return [stack lastObject];
}

- (void)popScene {
    if (stack.count > 1) {
        [stack removeLastObject];
    }
}

- (void)popToRoot {
    while (stack.count != 1) {
        [self popScene];
    }
}

@end
