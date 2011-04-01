//
//  MainMenu.m
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 4/1/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "MainMenu.h"


@implementation MainMenu


+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenu *layer = [MainMenu node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		
		self.isTouchEnabled = YES;
    }
    return self;
}


@end
