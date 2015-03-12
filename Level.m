//
//  Level.m
//  FlyingFeathers
//
//  Created by Test on 16.05.2014.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level.h"

@implementation Level
-(void)launchBird:(id)sender
{
    //Calculate the rotation in radians
    float rotationRaians = CC_DEGREES_TO_RADIANS(_launcher.rotation);
    //Vector for the rotation
    CGPoint directionVector = ccp(sinf(rotationRaians), cosf(rotationRaians));
    CGPoint ballOffset = ccpMult(directionVector, 50);
    
    //Load a ball and set its initial position
    CCNode* ball = [CCBReader load:@"Bird"];
    ball.position =ccpAdd(_launcher.position, ballOffset);
    
    //Add the ball to the physics node
    [_physicsNode addChild:ball];
    
    //Make an impulse and apply it
    CGPoint force = ccpMult(directionVector, 50000);
    [ball.physicsBody applyForce:force];
}
@end
