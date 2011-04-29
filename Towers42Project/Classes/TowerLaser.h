//
//  TowerLaser.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 4/5/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bullet.h"
#import "Tower.h"
#import "LaserBullet.h"

@interface TowerLaser : Tower <BulletSelector> {
    CGPoint laserEnd;    
}

- (CGPoint) getLaserEnd;

@end
