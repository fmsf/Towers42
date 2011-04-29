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

- (NSMutableArray*) generateWaveList:(Controller*) c_ref {
    return NULL;
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
		
	}
	return self;
}

- (void)dealloc {
	// release here
    [levelPath release];
    
    [super dealloc];
}

@end