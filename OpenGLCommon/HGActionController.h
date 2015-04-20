//
//  HGActionController.h
//  Lesson2
//
//  Created by Hell Ghost on 17.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HGActionController;

@protocol HGActionControllerDelegate <NSObject>

@optional
- (void)HGKeyDown:(NSEvent *)theEvent;
- (void)HGKeyUp:(NSEvent *)theEvent;
- (void)HGMouseDown:(NSEvent *)theEvent;
- (void)HGMouseDragged:(NSEvent *)theEvent;
- (void)HGMouseMoved:(NSEvent *)theEvent;
- (void)HGMouseUp:(NSEvent *)theEvent;
@end

@interface HGActionController : NSObject {
	
}
+ (instancetype)sharedController;
- (void)addTarget:(id <HGActionControllerDelegate>)target;
- (void)sendKeyDown:(NSEvent *)theEvent;
- (void)sendKeyUp:(NSEvent *)theEvent;
- (void)sendMouseDown:(NSEvent *)theEvent;
- (void)sendMouseDragged:(NSEvent *)theEvent;
- (void)sendMouseMoved:(NSEvent *)theEvent;
- (void)sendMouseUp:(NSEvent *)theEvent;
@end
