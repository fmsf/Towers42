//
//  PowerUp.mm
//  Towers42Project
//
//  Created by Guilherme Rodrigues on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PowerUp.h"

@implementation PowerUp

- (void) initPowerUp {
	hp = armor = speed = 1;
	exists	= false;
}

- (void) resetPowerUp {
	hp = armor = speed = 1;
	exists	= false;
}

- (void) addHpModifier:(float) hp_modifier {
	hp		= hp_modifier;
	exists	= true;
}

- (void) addArmorModifier:(float) armor_modifier {
	armor	= armor_modifier;
	exists	= true;
}

- (void) addSpeedModifier:(float) speed_modifier {
	speed	= speed_modifier;
	exists	= true;
}

- (float) getHpModifier {
	return hp;
}

- (float) getArmorModifier {
	return armor;
}

- (float) getSpeedModifier {
	return speed;
}

- (bool) isPowerUp {
	return exists;
}

- (id)init {
	
    if ((self=[super init])) {
		// code here
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end
