//
//  AppDelegate.m
//  DeepLinkDemo
//  Created by KANAKARAJU GANDREDDI on 11/23/17.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Page1ViewController.h"
#import "Page2ViewController.h"
#import "Page3ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    if([[url host] isEqualToString:@"com.test.DeepLinkDemo"]){
       
        UINavigationController *controller = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

        UIViewController *toPushController = nil;
        if([[url path] isEqualToString:@"/main"]){
          
            ViewController *mainController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"viewControllerId"];
            [controller setViewControllers:@[mainController]];
        }
        else if([[url path] isEqualToString:@"/page1"]){
            Page1ViewController *page1Controller = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page1"];

            toPushController = page1Controller;
        }
        else if([[url path] isEqualToString:@"/page2"]){
           
            Page2ViewController *page2Controller = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page2"];
            toPushController = page2Controller;
        }
        else if([[url path] isEqualToString:@"/page3"]){
            Page3ViewController *page3Controller = [mainStoryBoard instantiateViewControllerWithIdentifier:@"page3"];
            toPushController = page3Controller;
            
        }
        [controller pushViewController:toPushController animated:YES];
        return YES;
    }
    else{
        return NO;
    }
    
}


@end
