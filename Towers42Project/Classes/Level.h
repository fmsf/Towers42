/*
 *  Level.h
 *  Towers42Project
 *
 *  Created by Guilherme Rodrigues on 3/1/11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Level : NSObject {
	NSMutableArray* levelPath;
	float x_transform;
}

- (NSMutableArray*) getLevelPath;
- (float) getLevelTransform;

- (void) setLevelPath:(NSMutableArray*) n_levelPath;
- (void) setTransform:(float) n_transform;

@end