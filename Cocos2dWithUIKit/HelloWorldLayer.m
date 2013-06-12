//
//  HelloWorldLayer.m
//  Cocos2dWithUIKit
//
//  Created by Zhang Zhibin on 6/12/13.
//  Copyright Snow Storm Studio 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void)buttonTapped: (id)sender
{
    NSLog( @"button tapped");
//    wrapper.position = ccp(wrapper.position.x+10, wrapper.position.y + 10);
//    [label setString: @""];
    CGPoint pos = label.position;
    CCMoveTo* act_move_to_lef = [CCMoveTo actionWithDuration:1.0f position: ccp(pos.x - 100, pos.y)];
    CCMoveTo* act_move_to_right = [CCMoveTo actionWithDuration:1.0f position: ccp(pos.x, pos.y)];
    CCSequence* seq = [CCSequence actions:act_move_to_lef, act_move_to_right, nil];
    [label runAction: seq ];

    pos = textFieldWrapper.position;
    act_move_to_lef = [CCMoveTo actionWithDuration:2.0f position: ccp(pos.x - 120, pos.y)];
    act_move_to_right = [CCMoveTo actionWithDuration:2.0f position: ccp(pos.x, pos.y)];
    seq = [CCSequence actions:act_move_to_lef, act_move_to_right, nil];
    [textFieldWrapper runAction:seq];
}

// create and initialize a UIView item with the wrapper
-(void)addUIViewItem
{
    
    // create item programatically
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Clear Text" forState:UIControlStateNormal];
    button.frame = CGRectMake(0.0, 0.0, 120.0, 40.0);
    
//    [UITextField ]
    // put a wrappar around it
    wrapper = [CCUIViewWrapper wrapperForUIView:button];
    [self addChild:wrapper];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    CCLOG(@"textFieldDidEndEditing");
    [label setString: textField.text];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    CCLOG(@"textFieldShouldReturn");
	// the user pressed the "Done" button, so dismiss the keyboard
	[textField resignFirstResponder];
	return YES;
}
-(void)addTextField
{
    CGRect frame = CGRectMake(0, 0, 100, 30);
    textFieldNormal = [[UITextField alloc] initWithFrame:frame];
    
    textFieldNormal.borderStyle = UITextBorderStyleBezel;
    textFieldNormal.textColor = [UIColor blackColor];
    textFieldNormal.font = [UIFont systemFontOfSize:17.0];
    textFieldNormal.placeholder = @"<enter text>";
    textFieldNormal.backgroundColor = [UIColor whiteColor];
    textFieldNormal.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
    
    textFieldNormal.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
    textFieldNormal.returnKeyType = UIReturnKeyDone;
    
    textFieldNormal.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
    
//    textFieldNormal.tag = kViewTag;		// tag this control so we can remove it later for recycled cells
    
    textFieldNormal.delegate = self;	// let us be the delegate so we know when the keyboard's "Done" button is pressed
    
    // Add an accessibility label that describes what the text field is for.
    [textFieldNormal setAccessibilityLabel:@"NormalTextField"];
    textFieldWrapper = [CCUIViewWrapper wrapperForUIView: textFieldNormal];
    [self addChild:textFieldWrapper];
}
// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// create and initialize a Label
        label = [CCLabelTTF labelWithString:@"Hello World\r How are you doing~" fontName:@"Marker Felt" fontSize:24];
        label.position =  ccp( size.width/2, size.height/2 );
        // add the label as a child to this Layer
		[self addChild: label];
        
        sprite = [[CCSprite alloc] initWithFile:@"armour.png"];
        NSAssert(sprite, @"create sprite failed!!");
        sprite.position = ccp( size.width/2 - 100 , size.height/2 + 60 );
        [self addChild:sprite];

        [self addTextField];
        textFieldWrapper.position = ccp( size.width/2 - 100, size.height/2 + 30);
        
		[self addUIViewItem];
        wrapper.position = ccp( size.width/2 + 100, size.height/2 + 30);
        
		//
		// Leaderboards and Achievements
		//
		
//		// Default font size will be 28 points.
//		[CCMenuItemFont setFontSize:28];
//		
//		// Achievement Menu Item using blocks
//		CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
//			
//			
//			GKAchievementViewController *achievementViewController = [[GKAchievementViewController alloc] init];
//			achievementViewController.achievementDelegate = self;
//			
//			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
//			
//			[[app navController] presentModalViewController:achievementViewController animated:YES];
//			
//			[achievementViewController release];
//		}
//									   ];
//
//		// Leaderboard Menu Item using blocks
//		CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
//			
//			
//			GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
//			leaderboardViewController.leaderboardDelegate = self;
//			
//			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
//			
//			[[app navController] presentModalViewController:leaderboardViewController animated:YES];
//			
//			[leaderboardViewController release];
//		}
//									   ];
//		
//		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
//		
//		[menu alignItemsHorizontallyWithPadding:20];
//		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
//		
//		// Add the menu to the layer
//		[self addChild:menu];

	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)

    wrapper = nil;
    [button release];
    button=nil;
    
//    [sprite release];
//    sprite = Nil;
	// don't forget to call "super dealloc"
	[super dealloc];
}
- (void)onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    [self scheduleOnce:@selector(displayAnimation:) delay:1.0f];
}
- (void)onEnter
{
//    [wrapper runAction:[CCRotateTo actionWithDuration:10.0f angle:720]];
//    [wrapper runAction:[CCMoveTo actionWithDuration:10.0f position:ccp(200,200)]];
    [super onEnter];
}

//-(void) transform
//{
//    [wrapper updateUIViewTransform];
//    [super transform];
//}

-(void)displayAnimation: (ccTime)dtTime
{
    CGPoint pos = label.position;
    CCMoveTo* act_move_to_lef = [CCMoveTo actionWithDuration:1.0f position: ccp(pos.x - 100, pos.y)];
    CCMoveTo* act_move_to_right = [CCMoveTo actionWithDuration:1.0f position: ccp(pos.x, pos.y)];
    CCSequence* seq = [CCSequence actions:act_move_to_lef, act_move_to_right, nil];
    [label runAction: seq];
    
    NSAssert(sprite, @"sprite doesn't exist!!");
    pos = sprite.position;
    act_move_to_lef = [CCMoveTo actionWithDuration:2.0f position: ccp(pos.x - 120, pos.y)];
    act_move_to_right = [CCMoveTo actionWithDuration:2.0f position: ccp(pos.x, pos.y)];
    seq = [CCSequence actions:act_move_to_lef, act_move_to_right, nil];
    [sprite runAction: seq];
    
    pos = wrapper.position;
    act_move_to_lef = [CCMoveTo actionWithDuration:2.0f position: ccp(pos.x - 120, pos.y)];
    act_move_to_right = [CCMoveTo actionWithDuration:2.0f position: ccp(pos.x, pos.y)];
    seq = [CCSequence actions:act_move_to_lef, act_move_to_right, nil];
    [wrapper runAction:seq];
    
    pos = textFieldWrapper.position;
    act_move_to_lef = [CCMoveTo actionWithDuration:2.0f position: ccp(pos.x - 120, pos.y)];
    act_move_to_right = [CCMoveTo actionWithDuration:2.0f position: ccp(pos.x, pos.y)];
    seq = [CCSequence actions:act_move_to_lef, act_move_to_right, nil];
    [textFieldWrapper runAction:seq];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
