//
//  Tetris.h
//  Lesson2
//
//  Created by Hell_Ghost on 15.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGEngine.h"
#import "TetrisFabric.h"

@interface Tetris : HGScene {
    TetrisFabric *fabric;
	NSString *fieldData;
}

@end
