//
//  PowerUp.h
//  Towers42Project
//
//  Created by Guilherme Rodrigues on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Entity.h"

@interface PowerUp : Entity {
	// Modifier list
	float hp;
	float armor;
	float speed;
	
	bool exists;
}

- (void) initPowerUp;
- (void) resetPowerUp;

- (void) addHpModifier:(float) hp_modifier;
- (void) addArmorModifier:(float) armor_modifier;
- (void) addSpeedModifier:(float) speed_modifier;

- (float) getHpModifier;
- (float) getArmorModifier;
- (float) getSpeedModifier;

- (bool) isPowerUp;

@end
