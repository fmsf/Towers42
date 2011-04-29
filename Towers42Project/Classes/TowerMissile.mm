//
//  TowerMissile.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/23/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "TowerMissile.h"


@implementation TowerMissile

- (Bullet*) createNewBullet{
	return [[BulletMissile alloc] init];
}

- (id) initWithSeedTower:(Tower*) seed{
	if((self=[super init])){
        price = 10;
		isSeed = false;
		position = [seed getPosition];
		spriteSelector = [seed getSelector];
		turret = [CCSprite spriteWithFile:@"missileTurret.png"];
		[textures addObject:turret];
		shootSpeed = 5;
		shootTimer = 0.1;
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
