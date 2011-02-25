//
//  Controller.h
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Controller : NSObject {
	NSMutableArray* mapPath; // array of NSValues containing CGPoints ref: http://stackoverflow.com/questions/899600/how-can-i-add-cgpoint-objects-to-an-nsarray-the-easy-way
	NSMutableArray* creeps; 
	NSMutableArray* towers;
}

- (NSMutableArray*) getMapPath;
- (NSMutableArray*) getCreeeps;
- (NSMutableArray*) getTowers;
- (bool) execute;


@end
