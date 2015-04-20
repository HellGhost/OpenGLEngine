//
//  HGActionController.m
//  Lesson2
//
//  Created by Hell Ghost on 17.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGActionController.h"

@interface HGActionController () {
	NSMutableArray *targets;
}
@end

static HGActionController *sharedController = nil;

@implementation HGActionController

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
        targets = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addTarget:(id <HGActionControllerDelegate>)target {
	if ([targets indexOfObject:target] == NSNotFound) {
		[targets addObject:target];
	}
}
#pragma mark - Actions -
- (void)sendKeyDown:(NSEvent *)theEvent {
	for (id <HGActionControllerDelegate> target in targets) {
		if ([target respondsToSelector:@selector(HGKeyDown:)]) {
			[target HGKeyDown:theEvent];
		}
	}
}

- (void)sendKeyUp:(NSEvent *)theEvent {
	for (id <HGActionControllerDelegate> target in targets) {
		if ([target respondsToSelector:@selector(HGKeyUp:)]) {
			[target HGKeyUp:theEvent];
		}
	}
}

- (void)sendMouseDown:(NSEvent *)theEvent {
	for (id <HGActionControllerDelegate> target in targets) {
		if ([target respondsToSelector:@selector(HGMouseDown:)]) {
			[target HGMouseDown:theEvent];
		}
	}
}

- (void)sendMouseDragged:(NSEvent *)theEvent {
	for (id <HGActionControllerDelegate> target in targets) {
		if ([target respondsToSelector:@selector(HGMouseDragged:)]) {
			[target HGMouseDragged:theEvent];
		}
	}
}

- (void)sendMouseMoved:(NSEvent *)theEvent {
	for (id <HGActionControllerDelegate> target in targets) {
		if ([target respondsToSelector:@selector(HGMouseMoved:)]) {
			[target HGMouseMoved:theEvent];
		}
	}
}

- (void)sendMouseUp:(NSEvent *)theEvent {
	for (id <HGActionControllerDelegate> target in targets) {
		if ([target respondsToSelector:@selector(HGMouseUp:)]) {
			[target HGMouseUp:theEvent];
		}
	}
}

@end
