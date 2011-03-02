//
//  HelloWorldLayer.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright Student 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Level.h"
#import "Controller.h"
#import "GameGUI.h"
#import "defs.h"
#import "Creep.h"

// HelloWorld Layer
@interface MainScene : CCLayer{
	Controller* controller;
	GameGUI* myGui;
}

// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
