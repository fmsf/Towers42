//
//  TowerPellet.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/15/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "TowerPellet.h"


@implementation TowerPellet


- (id) initWithSeedTower:(Tower*) seed{
	if((self=[super init])){
		isSeed = false;
		position = [seed getPosition];		
		turret = [CCSprite spriteWithFile:@"pellet.png"];
		[textures addObject:turret];
		shootSpeed = 2;
		for(CCSprite* s in textures){
			s.position = position;
		}
	}
	
	return self;
}




- (id)init {
	
    if ((self=[super init])) {
	}
	return self;
}

- (void)dealloc {
	
    [super dealloc];
}

@end
