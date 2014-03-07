//
//  AppDelegate.h
//  Pods
//
//  Created by Chris Eidhof on 02.03.14.
//  Copyright (c) 2014 objc.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersistentStack;
@class PodsWebservice;
@class Importer;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) PersistentStack *persistentStack;
@property (nonatomic, strong) PodsWebservice *webservice;
@end
