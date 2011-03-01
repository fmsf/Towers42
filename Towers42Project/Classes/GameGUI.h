//
//  GameGUI.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 3/1/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameGUI : NSObject {
	NSMutableArray* spriteElements;
}

- (NSMutableArray*) getElements;

@end
