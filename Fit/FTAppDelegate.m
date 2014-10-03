//
//  FTAppDelegate.m
//  Fit
//
//  Created by folse on 7/23/14.
//  Copyright (c) 2014 Folse. All rights reserved.
//

#import "FTAppDelegate.h"
#import "JDMenuViewController.h"
#import "RESideMenu.h"

@implementation FTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:APP_COLOR];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica-Light" size:20.0],NSFontAttributeName,nil]];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
	
    UINavigationController *navController = [STORY_BOARD instantiateViewControllerWithIdentifier:@"mainNav"];
	RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navController
																	leftMenuViewController:[JDMenuViewController new]
																   rightMenuViewController:nil];
	
	sideMenuViewController.backgroundImage = [UIImage imageNamed:@"bg_menu"];
	sideMenuViewController.menuPreferredStatusBarStyle = 1;
	sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
	sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
	sideMenuViewController.contentViewShadowOpacity = 0.6;
	sideMenuViewController.contentViewShadowRadius = 12;
	sideMenuViewController.contentViewShadowEnabled = YES;
	self.window.rootViewController = sideMenuViewController;
	
    [Parse setApplicationId:@"pUeCyCXFM7p0LydirrLlkzwMaNggkfkQ0jRRPxFG"
                  clientKey:@"pr6KFSuqxvGwh1L1aYwRNzGDwCC0gFNgWOVSvJXO"];
    
    [MobClick startWithAppkey:@"540eccd6fd98c560a30035fa"];
  
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
