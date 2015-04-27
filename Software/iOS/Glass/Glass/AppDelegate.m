//
//  AppDelegate.m
//  Glass
//
//  Created by Josh Billions on 12/9/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import "AppDelegate.h"
#import "NetworkManager.h"
#import "WatchCoreDataProxy.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[NetworkManager sharedInstance] subscribeToMatrixUpdates];
    [[NetworkManager sharedInstance] askForAutomarchSettings];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[NetworkManager sharedInstance] unsubscribeFromMatrixUpdates];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[NetworkManager sharedInstance] unsubscribeFromMatrixUpdates];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[NetworkManager sharedInstance] subscribeToMatrixUpdates];
    [[NetworkManager sharedInstance] askForAutomarchSettings];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[NetworkManager sharedInstance] subscribeToMatrixUpdates];
    [[NetworkManager sharedInstance] askForAutomarchSettings];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[NetworkManager sharedInstance] unsubscribeFromMatrixUpdates];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [[WatchCoreDataProxy sharedInstance] saveContext];
}

#pragma mark - WatchKit

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply {
    /*
     Because this method is likely to be called when the app is in the
     background, begin a background task. Starting a background task ensures
     that your app is not suspended before it has a chance to send its reply.
     */
    
    __block UIBackgroundTaskIdentifier identifier = UIBackgroundTaskInvalid;
    // The "endBlock" ensures that the background task is ended and the identifier is reset.
    dispatch_block_t endBlock = ^ {
        if (identifier != UIBackgroundTaskInvalid) {
            [application endBackgroundTask:identifier];
        }
        identifier = UIBackgroundTaskInvalid;
    };
    
    identifier = [application beginBackgroundTaskWithExpirationHandler:endBlock];
    
    // Re-assign the "reply" block to include a call to "endBlock" after "reply" is called.
    reply = ^(NSDictionary *replyInfo) {
        reply(replyInfo);
        
        // This dispatch_after of 2 seconds is only needed on iOS 8.2. On iOS 8.3+, it is not needed. You can call endBlock() by itself.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
            endBlock();
        });
    };
    
    // Receives text input result from the WatchKit app extension.
    NSLog(@"User Info: %@", userInfo);
    
    // Sends a confirmation message to the WatchKit app extension that the text input result was received.
    reply(@{@"Confirmation" : @"Text was received."});
}


#pragma mark - Core Data stack


@end
