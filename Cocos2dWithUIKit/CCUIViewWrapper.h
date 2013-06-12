//
//  CCUIViewWrapper.h
//  Cocos2dWithUIKit
//
//  Created by Zhang Zhibin on 6/12/13.
//  Copyright (c) 2013 Snow Storm Studio. All rights reserved.
//

#import "CCSprite.h"

#import "cocos2d.h"

@interface CCUIViewWrapper : CCSprite
{
    UIView *uiItem;
    float rotation;
}

@property (nonatomic, retain) UIView *uiItem;

+ (id) wrapperForUIView:(UIView*)ui;
- (id) initForUIView:(UIView*)ui;

- (void) updateUIViewTransform;

@end