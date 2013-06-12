//
//  IntroLayer.m
//  Cocos2dWithUIKit
//
//  Created by Zhang Zhibin on 6/12/13.
//  Copyright Snow Storm Studio 2013. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "HelloWorldLayer.h"


#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(id) init
{
	if( (self=[super init])) {

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];

//		CCSprite *background;
		
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
			background = [CCSprite spriteWithFile:@"armour.png"];
//			background.rotation = 90;
		} else {
			background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
		}
		background.position = ccp(size.width/2, size.height/2);

		// add the label as a child to this Layer
		[self addChild: background];
	}
	
	return self;
}

-(void) onEnter
{
	[super onEnter];
    [self scheduleOnce:@selector(displayAnimate:) delay:1.0f];
}
-(void) showNextScene: (ccTime)dtTime
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] ]];
    
}
-(void)displayAnimate: (ccTime)dtTime
{
    CGPoint pos = background.position;
    CCMoveTo* act_move_to_lef = [CCMoveTo actionWithDuration:1.0f position: ccp(pos.x - 100, pos.y)];
    CCMoveTo* act_move_to_right = [CCMoveTo actionWithDuration:1.0f position: ccp(pos.x, pos.y)];
    CCCallFunc* act_call = [CCCallFunc actionWithTarget:self selector:@selector(showNextScene:)];
    CCSequence* seq = [CCSequence actions:act_move_to_lef, act_move_to_right, act_call, nil];
    
    [background runAction: seq ];
}
@end
