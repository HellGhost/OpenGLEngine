//
//  TetrisFigure.h
//  Lesson2
//
//  Created by Hell_Ghost on 19.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "HGEngine.h"
#import "TetrisRect.h"

@interface TetrisFigure : HGObject {
    
}
@property (nonatomic, readonly) NSString *matrix;
- (instancetype)initWithMatrix:(NSString*)matrix;
- (void)rotate;
@end
