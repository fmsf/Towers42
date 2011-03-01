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


- (NSMutableArray*) getLevelPath{
	return levelPath;
}

- (float) getLevelTransform{
	return x_transform;
}

- (void) setLevelPath:(NSMutableArray*) n_levelPath {
	levelPath = n_levelPath;
}

- (void) setTransform:(float) n_transform {
	x_transform = n_transform;
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
		levelPath = [NSMutableArray arrayWithObjects:
				   [NSValue valueWithCGPoint:CGPointMake(100, 0)],
				   [NSValue valueWithCGPoint:CGPointMake(100, 100)],
				   nil];
		
		x_transform = 0.0f;
		
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end