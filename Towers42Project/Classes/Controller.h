//
//  Controller.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Level.h"

@interface Controller : NSObject {
	NSMutableArray* mapPath; // array of NSValues containing CGPoints ref: http://stackoverflow.com/questions/899600/how-can-i-add-cgpoint-objects-to-an-nsarray-the-easy-way
	NSMutableArray* creeps; 
	NSMutableArray* towers;
	
	NSMutableArray* mapDir; // array containing the waypoint directions
	
	
	Level* newLvl;
	int		pathLenght;
	float	pathTransform;
	bool ready;
}

- (NSMutableArray*) getMapPath;
- (NSMutableArray*) getMapDir;
- (NSMutableArray*) getCreeeps;
- (NSMutableArray*) getTowers;

- (bool) execute:(float) delta;

- (bool) setNewLevel:(Level*) n_level;

- (int) getPathLenght;
- (bool) isReady;

@end
