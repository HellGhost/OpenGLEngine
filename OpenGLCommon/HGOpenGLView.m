//
//  HGOpenGLView.m
//  Lesson2
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGOpenGLView.h"
#import "HGActionController.h"

@implementation HGOpenGLView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupRender];
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect pixelFormat:(NSOpenGLPixelFormat *)format {

    self = [super initWithFrame:frameRect pixelFormat:format];
    if (self) {
		NSOpenGLPixelFormatAttribute attributes [] = {
			NSOpenGLPFAWindow,
			NSOpenGLPFADepthSize, (NSOpenGLPixelFormatAttribute)16,
			(NSOpenGLPixelFormatAttribute)nil
		};
		NSOpenGLPixelFormat* pixFmt =[[NSOpenGLPixelFormat alloc] initWithAttributes:attributes];
		self.pixelFormat = pixFmt;
        [self setupRender];
    }
    return self;
}

- (void)setupRender {
    render = [[HGRenderOneX alloc] init];
    [render setTimeUpdate:1.f/60.f];
}

- (void)setFrameSize:(NSSize)newSize {
    [super setFrameSize:newSize];
    render.screenSize = newSize;
}

- (void)keyDown:(NSEvent *)theEvent {
//	[self interpretKeyEvents: [NSArray arrayWithObject: theEvent]];
	[[HGActionController sharedController] sendKeyDown:theEvent];
}

- (void)keyUp:(NSEvent *)theEvent {
	[[HGActionController sharedController] sendKeyUp:theEvent];
}

- (void)mouseDown:(NSEvent *)theEvent {
	[[HGActionController sharedController] sendMouseDown:theEvent];
}

- (void)mouseDragged:(NSEvent *)theEvent {
	[[HGActionController sharedController] sendMouseDragged:theEvent];
}

- (void)mouseMoved:(NSEvent *)theEvent {
	[[HGActionController sharedController] sendMouseMoved:theEvent];
}

- (void)mouseUp:(NSEvent *)theEvent {
	[[HGActionController sharedController] sendMouseUp:theEvent];
}

- (BOOL)acceptsFirstResponder {
    return YES;
}
@end
