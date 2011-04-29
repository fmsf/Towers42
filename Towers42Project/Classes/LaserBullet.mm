//
//  LaserBullet.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 4/5/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "LaserBullet.h"


@implementation LaserBullet

- (id)init {
	
    if ((self=[super init])) {
		CCSprite* firstSprite = [CCSprite spriteWithFile:@"missile.png"];
		[textures addObject:firstSprite];
		velocity = 10.0f;
		damage = 5.0f;
        range = 100;
		armorPenetration = 0;
		splash_radius = 30;
		onScreen = false;
	}
	return self;
}

- (bool) update{
    if(target==NULL || [target getStatus]==CREEP_DEAD || [target getStatus]== CREEP_TO_RELEASE){
		[self clearTarget];
		return false;
	}
    
    for(Creep* c in creepList){
        [c receiveAttack:damage :armorPenetration];
    }    
    return false;
}

- (void)dealloc {
	// release here
	[creepList release];
    [super dealloc];
}

@end
