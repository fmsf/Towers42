//
//  HelloWorldLayer.m
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright Student 2011. All rights reserved.
//

// Import the interfaces
#import "MainScene.h"

// HelloWorld implementation
@implementation MainScene

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainScene *layer = [MainScene node];
	
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
		
		target = [CCSprite spriteWithFile:@"target-icon-th.png"];
		target.opacity = 0;
		target.position = ccp(100,100);
		
		self.isTouchEnabled = YES;

		
		[self addChild:target];
		
		
		myGui = [[GameGUI alloc] init];
		for (CCSprite* sprite in [myGui getElements]){
			[self addChild:sprite];
		}
			
		// add the label as a child to this Layer
		//[self addChild: label];
		controller = [[Controller alloc] init];
		
				
		
		[self schedule:@selector(tick:)];
	}
	return self;
}

- (void)tick:(ccTime) dt {
/*	int t=123;
	NSLog(@"Um exemplo de log %d", t);*/
	if([controller isReady]){
		[controller execute: dt];
		[self updateCreeps:[controller getCreeps]];
	}
}

// You have to over-ride this method
-(void)draw{
    glColor4f(0.8, 1.0, 0.76, 1.0);  
    glLineWidth(7.0f);
	//ccDrawLine(ccp(300,470), ccp(100,100));
//    drawLine(10,100,50,79);
	int i;
	NSMutableArray* path = [controller getMapPath];
	for(i=1;i<[controller getPathLenght];i++){
		NSValue *val = [path objectAtIndex:i-1]; 
		CGPoint p1 = [val CGPointValue];
		val = [path objectAtIndex:i];
		CGPoint p2 = [val CGPointValue];
		
		glColor4f(0.8, 1.0, 0.76, 0.3);  
		glLineWidth(7.0f);
		ccDrawLine(p1,p2);
		
		glColor4f(0.3, 0.3, 1.0, 0.7);  
		glLineWidth(3.0f);
		ccDrawLine(p1,p2);
	}

}


- (void) updateCreeps:(NSMutableArray*)creepList{
	for(Creep* c in creepList){
		if([c getStatus]==CREEP_CREATED){
			[self addChild:[c getSprite]];
			[c setStatus:CREEP_ACTIVE];
		}else if([c getStatus]==CREEP_ACTIVE){
			CCSprite* sprite = [c getSprite];
			sprite.position=[c getPosition];
			sprite.rotation=[c getRotation];
		}else if([c getStatus]==CREEP_DEAD){
			[self removeChild:[c getSprite] cleanup:false];
			[c setStatus:CREEP_TO_RELEASE];
		}
	}
}


- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
	if(target_is_active){
		target.opacity =0;
		if(location.y>BOTTOM_LIMIT-TARGET_Y_OFFSET && selectedTower==NULL){ 			//ADD NEW TOWER
			// CHECK IF TOWERS OVERLAP 
			int target_x = location.x;
			int target_y = location.y+TARGET_Y_OFFSET;
			bool doNothing = false;
			NSMutableArray* towers = [controller getTowers];
			for(Tower* t in towers){
				CGPoint towerPosition = [t getPosition];
				if(towerPosition.x+TOWER_PROXIMITY_OFFSET>target_x &&
				   towerPosition.x-TOWER_PROXIMITY_OFFSET<target_x &&
				   towerPosition.y+TOWER_PROXIMITY_OFFSET>target_y &&
				   towerPosition.y-TOWER_PROXIMITY_OFFSET<target_y){
					doNothing = true;
					break;
				}								
			}
			
			// IF THEY DONT CREATE NEW TOWER
			if(!doNothing){
				NSMutableArray* towers  = [controller getTowers];
				Tower* newTower = [[Tower alloc] init];
				[newTower setPosition:ccp(target_x,target_y)];
				[self addChild:[newTower getSprite] z:2];
				[self addChild:[newTower getSelector] z:1];
				[newTower inScene:true];
				[towers addObject:newTower];
			}
		}
		[myGui towerSelected:selectedTower];
	}else { // clicked inside gameGUI;
//		if(
	}
    
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	if(target_is_active){
		if(location.y <= BOTTOM_LIMIT-TARGET_Y_OFFSET){
			target.opacity = 0;
		}else{
			target.position = ccp(location.x,location.y+TARGET_Y_OFFSET);
			target.opacity = 150;
			NSMutableArray* towers = [controller getTowers];
			bool selectionHappens = false;
			for(Tower* t in towers){
				if([t tryToSelectByTouch:location.x :location.y+TARGET_Y_OFFSET]){
					if(selectedTower!=NULL && selectedTower!= t){
						[selectedTower disableTower];
					}
					selectedTower = t;
					selectionHappens = true;
					break;
				}
			}
			if(!selectionHappens){
				selectedTower = NULL;
			}
		}
	}

}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:[touch view]];
	location = [[CCDirector sharedDirector] convertToGL:location];
	if(location.y>BOTTOM_LIMIT){
		target_is_active = true;
		target.position = ccp(location.x,location.y+TARGET_Y_OFFSET);
		target.opacity = 150;
	}
	
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
