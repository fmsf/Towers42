//
//  Entity.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "defs.h"

@interface Entity : NSObject {
	NSMutableArray* textures;
	int animationFrameRate;
	int currentFrame;
	CGPoint position;
	int active;
	
	float rotation;
}

- (CGPoint) getPosition;
- (void) setPosition:(CGPoint) point;
- (CCSprite*) getSprite;
- (void) animate:(ccTime) dt;
- (int) getStatus;
- (void) setStatus:(int) new_status;
- (void) setRotation:(float) n_rotation;
- (float) getRotation;

@end
