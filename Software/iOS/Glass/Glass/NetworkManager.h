//
//  NetworkManager.h
//  Glass
//
//  Created by Josh Billions on 12/9/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MSGridView;

@interface NetworkManager : NSObject

+(NetworkManager *)sharedInstance;

@property (nonatomic, weak) MSGridView *gridView;

-(void)sendMessage:(NSString *)message;
-(void)askForAutomarchSettings;
-(void)askForAutomarchSettingsWithCompletionHandler:(void(^)(bool automarchState, NSNumber *automarchSpeed))completionHandler;

-(void)subscribeToMatrixUpdates;
-(void)unsubscribeFromMatrixUpdates;

@property (nonatomic, strong) NSNumber *automarchState;
@property (nonatomic, strong) NSNumber *automarchSpeed;
@property (nonatomic, strong) NSString *mostRecentMatrix;

@end
