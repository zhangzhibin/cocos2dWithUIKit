//
//  IntroLayer.h
//  Cocos2dWithUIKit
//
//  Created by Zhang Zhibin on 6/12/13.
//  Copyright Snow Storm Studio 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface IntroLayer : CCLayer
{
    CCSprite *background;
//    CCLabelTTF* label;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
