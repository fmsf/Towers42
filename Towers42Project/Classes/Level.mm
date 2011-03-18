/*
 *  Level.mm
 *  Towers42Project
 *
 *  Created by Guilherme Rodrigues on 3/1/11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

#import "Level.h"

@implementation Level


- (NSMutableArray*) getLevelPath {
	return levelPath;
}

- (int) getLevelPathLenght {
	return pathLenght;
}

- (float) getLevelTransform {
	return x_transform;
}

- (void) setLevelPath:(NSMutableArray*) n_levelPath {
	levelPath = n_levelPath;
}

- (void) setPathLenght:(int) n_pathLenght {
	pathLenght = n_pathLenght;
}

- (void) setTransform:(float) n_transform {
	x_transform = n_transform;
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
		levelPath = [[NSMutableArray alloc] initWithObjects:
					 [NSValue valueWithCGPoint:CGPointMake(150, 100)],
					 [NSValue valueWithCGPoint:CGPointMake(150, 200)],
					 [NSValue valueWithCGPoint:CGPointMake(160, 300)],
					 [NSValue valueWithCGPoint:CGPointMake(150, 250)],
					 [NSValue valueWithCGPoint:CGPointMake(100, 200)],
					 [NSValue valueWithCGPoint:CGPointMake(80,  230)],
					 [NSValue valueWithCGPoint:CGPointMake(100, 380)],
					 [NSValue valueWithCGPoint:CGPointMake(160, 480)],
				   NULL];
		
		x_transform = 0.0f;
		
		pathLenght=8;
		
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end