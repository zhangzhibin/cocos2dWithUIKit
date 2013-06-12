//
//  HelloWorldLayer.h
//  Cocos2dWithUIKit
//
//  Created by Zhang Zhibin on 6/12/13.
//  Copyright Snow Storm Studio 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "CCUIViewWrapper.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate,UITextFieldDelegate>
{
    CCLabelTTF *label;
    
    UIButton * button;
    CCUIViewWrapper *wrapper;

    UITextField *textFieldNormal;
    CCUIViewWrapper *textFieldWrapper;
    
    CCSprite* sprite;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
