//
//  HGDirector.h
//  Lesson2
//
//  Created by Hell_Ghost on 14.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HGScene.h"

@interface HGNavigationController : NSObject {
    
}
@property (nonatomic, readonly) NSMutableArray *stack;

+(instancetype)sharedController;

- (void)pushScene:(HGScene*)scene;
- (void)popScene;
- (void)popToRoot;

- (HGScene*)visibleScene;
@end
