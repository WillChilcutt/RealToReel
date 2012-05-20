//
//  AppDelegate.h
//  RealToReel
//
//  Created by Will Chilcutt on 5/20/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *chosenURL;
}

@property (strong, nonatomic) UIWindow *window;
@property (readwrite, retain) NSString *chosenURL;

@end
