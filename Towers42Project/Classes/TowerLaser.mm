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
		shootSpeed = 0.1;
		shootTimer = 0.1;
		for(CCSprite* s in textures){
			s.position = position;
		}
	}
	
	return self;
}

- (CGPoint) getLaserEnd{
    return laserEnd;
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
            float correction = 400;
            
            NSMutableArray* targetList = [[NSMutableArray alloc] init];
            
            CGPoint p = laserEnd = ccp(position.x-2*(position.x-targetPosition.x), position.y-2*(position.y-targetPosition.y));
            
            for(Creep* creep in creepList){
                CGPoint creepPos = [creep getPosition];
                //float crossproduct = abs((p.y-position.y)*(targetPosition.x-position.x)-(p.x-position.x)*(targetPosition.y-position.y));
                
                float crossproduct = abs((creepPos.y-position.y)*(p.x-position.x)-(creepPos.x-position.x)*(p.y-position.y));
                if(crossproduct<correction){
                    [targetList addObject:creep];
                }
            }
            Bullet* bullet = [self createNewBullet];
            [bullet setCreepList:targetList];
            [bullet setTarget:target];
            [bullets addObject:bullet];
            [bullet update];
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
