//
//  MyClass.m
//  Towers42Project
//
//  Created by Guilherme Rodrigues on 4/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LevelTest.h"
#import "CreepSpawn.h"
#import "CreepFast.h"

@implementation LevelTest

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        levelPath = [[NSMutableArray alloc] initWithObjects:
					 [NSValue valueWithCGPoint:CGPointMake(150, 100)],
					 [NSValue valueWithCGPoint:CGPointMake(150, 200)],
					 [NSValue valueWithCGPoint:CGPointMake(160, 300)],
					 [NSValue valueWithCGPoint:CGPointMake(150, 250)],
					 [NSValue valueWithCGPoint:CGPointMake(100, 200)],
					 [NSValue valueWithCGPoint:CGPointMake(80,  230)],
					 [NSValue valueWithCGPoint:CGPointMake(100, 380)],
					 [NSValue valueWithCGPoint:CGPointMake(160, 480)],
                     NULL];
        
        pathLenght = 8;
        
        x_transform = 0.0;
    }
    
    return self;
}

- (NSMutableArray*) generateWaveList: (Controller*) c_ref {
    NSMutableArray* waveList = [[NSMutableArray alloc] init];
    
    Wave* wave;
    
    CreepSpawn*     seedSpawn	= [[CreepSpawn alloc] init];
    CreepFast*		seedFast	= [[CreepFast alloc] init];
    
    //- (void) initWave:(Controller*) contr:(Creep*) instance:(int) n_size: (float) creep_intv;
    for(int i=0; i<10; i++) {
        wave = [[Wave alloc] init];
        [wave initWave: c_ref: seedSpawn :5 : 0.5f ];
        //- (void) setWaveInterval:(float) wave_intv: (int) n_waves
        [wave setWaveInterval: 5.0f: 1];
        
        [waveList addObject: wave];
        
        [wave release];
        wave = [[Wave alloc] init];
        
        //n_size: (float) wave_intv: (float) creep_intv: (float) timeToSpawn
        [wave initWave: c_ref: seedFast :5 : 0.1f ];
        [wave setWaveInterval: 5.0f: 1];		
        [waveList addObject: wave];
        [wave  release];
        
    }
    
    [seedSpawn release];
    [seedFast	release];
    
    return [waveList autorelease];
}

- (void)dealloc
{
    [super dealloc];
}

@end
