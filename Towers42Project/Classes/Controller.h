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
#import "Wave.h"
#import "Tower.h"

// CGPoints ref: http://stackoverflow.com/questions/899600/how-can-i-add-cgpoint-objects-to-an-nsarray-the-easy-way

@interface Controller : NSObject {
	
	/*
	 *	Creep variables
	 */
	
	NSMutableArray* creeps;		// living the good life in game
	NSMutableArray* elders;		// creeps ready to die
	NSMutableArray* dead;		// dead creeps
	
	/*
	 *	Wave variables
	 */
	bool used;
	NSMutableArray* waves;
	float player1WaveTimer;
	
	float timer;
	
	/*
	 *	Path variables
	 */
	
	int				pathLenght;		// size of the path
	float			pathTransform;	// transform to be applied to multiplayer second path
	NSMutableArray* mapPath;		// array with path waypoints
	NSMutableArray* mapDir;			// array containing the waypoint directions
	
	/*
	 *	Tower variables
	 */
	
	NSMutableArray* towers;
	NSMutableArray* bullets;
	
	/*
	 *	Miscelaneous
	 */
	
	Level*	newLvl;
	bool	ready;
}

- (void) registerDying:(Creep*) dying;

- (NSMutableArray*) getMapPath;
- (NSMutableArray*) getMapDir;
- (NSMutableArray*) getCreeps;
- (NSMutableArray*) getTowers;

- (bool) execute:(float) delta;

- (bool) setNewLevel:(Level*) n_level;

- (int) getPathLenght;
- (bool) isReady;

- (float*) getTimer;
- (float*) getPlayer1WaveTimer;

@end
