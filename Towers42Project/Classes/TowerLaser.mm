//
//  TowerLaser.mm
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 4/5/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "TowerLaser.h"


@implementation TowerLaser

- (Bullet*) createNewBullet{
	return [[LaserBullet alloc] init];
}

- (id) initWithSeedTower:(Tower*) seed{
	if((self=[super init])){
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

- (void) shoot:(float) delta{
	shootTimer -= delta;
	if(isSeed || target==NULL) {
		for(Bullet* b in bullets){
			[b update];
		}
		return;
	}
	if([target getStatus] == CREEP_TO_RELEASE){
		[self clearTarget];
		return;		 
	}
	shootTimer -= delta;
	if(shootTimer <= 0){
		shootTimer = shootSpeed;
		if(target!=NULL){
            CGPoint targetPosition = [target getPosition];
            /*float angle = ccpAngle(position, targetPosition);
            float perpendicular = angle + PI/2;*/
            float correction = 1;
            
            NSMutableArray* targetList = [[NSMutableArray alloc] init];
            
            for(Creep* creep in creepList){
                CGPoint p = [creep getPosition];
                float crossproduct = abs((p.y-position.y)*(targetPosition.x-position.x)-(p.x-position.x)*(targetPosition.y-position.y));
                NSLog(@"%f",crossproduct);
                if(crossproduct<correction){
                    [targetList addObject:creep];
                }
            }
            Bullet* bullet = [self createNewBullet];
            [bullet setCreepList:targetList];
            [bullet setTarget:target];
            [bullets addObject:bullet];
		}
	}
	[self clearTarget];
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
