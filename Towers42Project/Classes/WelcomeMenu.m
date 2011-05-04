//
//  WelcomeMenu.m
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 5/4/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "WelcomeMenu.h"


@implementation WelcomeMenu


+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WelcomeMenu *layer = [WelcomeMenu node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		CCSprite *background = [CCSprite spriteWithFile:@"tower42_bg.png"];
        background.position = ccp(160,240);
        [self addChild:background];
        
        elementsEnabled[0] = [CCSprite spriteWithFile:@"btn_multiplayer_click.png"];
        elementsDisabled[0] = [CCSprite spriteWithFile:@"btn_multiplayer_normal.png"];
        elementsEnabled[0].position = elementsDisabled[0].position = ccp(165,260);
        [self addChild:elementsEnabled[0]];
        [self addChild:elementsDisabled[0]];
        
        
        elementsEnabled[1] = [CCSprite spriteWithFile:@"btn_campaign_click.png"];
        elementsDisabled[1] = [CCSprite spriteWithFile:@"btn_campaign_normal.png"];         
        elementsEnabled[1].position = elementsDisabled[1].position = ccp(165,260);
        [self addChild:elementsEnabled[1]];
        [self addChild:elementsDisabled[1]];
        
        elementsEnabled[2] = [CCSprite spriteWithFile:@"btn_survival_click.png"];
        elementsDisabled[2] = [CCSprite spriteWithFile:@"btn_survival_normal.png"]; 
        elementsEnabled[2].position = elementsDisabled[2].position = ccp(165,260);
        [self addChild:elementsEnabled[2]];
        [self addChild:elementsDisabled[2]];
        
        elementsEnabled[3] = [CCSprite spriteWithFile:@"btn_achievements_click.png"];
        elementsDisabled[3] = [CCSprite spriteWithFile:@"btn_achievements_normal.png"]; 
        elementsEnabled[3].position = elementsDisabled[3].position = ccp(165,260);
        [self addChild:elementsEnabled[3]];
        [self addChild:elementsDisabled[3]];
        
        elementsEnabled[4] = [CCSprite spriteWithFile:@"btn_options_click.png"];
        elementsDisabled[4] = [CCSprite spriteWithFile:@"btn_options_normal.png"]; 
        elementsEnabled[4].position = elementsDisabled[4].position = ccp(165,260);
        [self addChild:elementsEnabled[4]];
        [self addChild:elementsDisabled[4]];
        
        for(int i=0;i<5;i++){
            elementsEnabled[i].opacity = 0;
        }

	}
	return self;
}



- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];

}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];	
    
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
