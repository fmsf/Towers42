//
//  WelcomeMenu.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 5/4/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface WelcomeMenu : CCLayer {
    CCSprite* elementsEnabled[5];
    CCSprite* elementsDisabled[5];
}

+(id) scene;


@end
