//
//  TetrisFabric.m
//  Lesson2
//
//  Created by Hell_Ghost on 19.07.14.
//  Copyright (c) 2014 Hell_Ghost. All rights reserved.
//

#import "TetrisFabric.h"
#import "HGMath.h"

//#define MAX_MODE 0

@implementation TetrisFabric

- (instancetype)init
{
    self = [super init];
    if (self) {
        figuresArray = [[NSMutableArray alloc] init];
        NSString *o = @"0000,0110,0110,0000";
        NSString *i = @"0010,0010,0010,0010";
        NSString *s = @"000,011,110";
        NSString *z = @"000,110,011";
        NSString *l = @"100,100,110";
        NSString *j = @"010,010,110";
        NSString *t = @"000,111,010";
        [figuresArray addObject:o];
        [figuresArray addObject:i];
        [figuresArray addObject:s];
        [figuresArray addObject:z];
        [figuresArray addObject:l];
        [figuresArray addObject:j];
        [figuresArray addObject:t];
#ifdef MAX_MODE
        NSString *plus = @"010,111,010";
        NSString *x = @"101,010,101";
        NSString *c = @"111,100,111";
        [figuresArray addObject:plus];
        [figuresArray addObject:x];
        [figuresArray addObject:c];
#endif
        
    }
    return self;
}
- (TetrisFigure*)getRandomFigure {
    int index = arc4random()%figuresArray.count;
    return [self figurewithIndex:index];
}

- (TetrisFigure*)figurewithIndex:(int)index {
    if (figuresArray.count && index < figuresArray.count) {
		Color4f figureColor = Color4fZero();
		switch (index) {
			case 0:
				figureColor = color4Byte(255, 255, 0, 1);
				break;
			case 1:
				figureColor = color4Byte(255, 102, 0, 1);
				break;
			case 2:
				figureColor = color4Byte(0, 255, 0, 1);
				break;
			case 3:
				figureColor = color4Byte(255, 102, 0, 1);
				break;
			case 4:
				figureColor = color4Byte(0, 0, 255, 1);
				break;
			case 5:
				figureColor = color4Byte(255, 0, 0, 1);
				break;
			case 6:
				figureColor = color4Byte(204, 0, 255, 1);
			default:
				break;
		}
        NSString *matrix = [figuresArray objectAtIndex:index];
		TetrisFigure *figure = [[TetrisFigure alloc] initWithMatrix:matrix];
		figure.color = figureColor;
        return figure;
    }
    return nil;

}
@end
