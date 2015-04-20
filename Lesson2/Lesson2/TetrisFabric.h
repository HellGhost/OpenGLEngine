//
//  TetrisFabric.h
//  Lesson2
//
//  Created by Hell_Ghost on 19.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TetrisFigure.h"

@interface TetrisFabric : NSObject {
    NSMutableArray *figuresArray;
}

- (TetrisFigure*)getRandomFigure;
- (TetrisFigure*)figurewithIndex:(int)index;
@end
