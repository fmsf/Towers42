//
//  Controller.m
//  Towers42Project
//
//  Created by Francisco M. Silva Ferreira on 2/25/11.
//  Copyright 2011 Student. All rights reserved.
//

#import "Controller.h"
#import "TestCreep.h"


@implementation Controller


- (NSMutableArray*) getMapPath{
	return mapPath;
}

- (NSMutableArray*) getCreeeps{
	return creeps;
}

- (NSMutableArray*) getTowers{
	return towers;
}



- (id)init {
	
    if ((self=[super init])) {
		// code here
		mapPath = [NSMutableArray arrayWithObjects:
						[NSValue valueWithCGPoint:CGPointMake(100, 0)],
						[NSValue valueWithCGPoint:CGPointMake(100, 100)],
						[NSValue valueWithCGPoint:CGPointMake(220, 280)],
						[NSValue valueWithCGPoint:CGPointMake(220, 380)],
						nil];
		
		creeps = [NSMutableArray arrayWithObjects:[[TestCreep alloc]init],nil];
		
	}
	return self;
}

- (void)dealloc {
	// release here
	
    [super dealloc];
}

@end
