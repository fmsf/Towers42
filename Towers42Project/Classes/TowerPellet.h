//
//  TowerPellet.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/15/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Tower.h"
#import "BulletPellet.h"

@interface TowerPellet : Tower <BulletSelector> {

}

- (id) initWithSeedTower:(Tower*) seed;

@end
