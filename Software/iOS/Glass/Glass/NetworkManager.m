//
//  NetworkManager.m
//  Glass
//
//  Created by Josh Billions on 12/9/14.
//  Copyright (c) 2014 Catalyze Chicago. All rights reserved.
//

#import "NetworkManager.h"
#import "GCDAsyncUdpSocket.h"
#import "MSGridView.h"
#import "MSGridViewCell.h"

@interface NetworkManager()

@property (nonatomic, strong) GCDAsyncUdpSocket *udpSocket;
@property (nonatomic, strong) void (^automarchCompletionBlock)(bool, NSNumber*);

@end

@implementation NetworkManager

static NetworkManager *sharedInstance = nil;

+ (NetworkManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NetworkManager alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.udpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        NSError *bindError = nil;
        if (![self.udpSocket bindToPort:6667 error:&bindError]) {
            NSLog(@"Error binding: %@", bindError);
        }
        NSError *rxError = nil;
        if (![self.udpSocket beginReceiving:&rxError]) {
            NSLog(@"Error binding: %@", rxError);
        }
        NSLog(@"UDP Socket Ready");
        [self sendMessage:@"a!"]; //Ask for matrix updates
    }
    return self;
}

-(void)dealloc{
    [self sendMessage:@"x!"]; //Stop matrix updates
}

-(void)sendMessage:(NSString *)message{
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    [self.udpSocket sendData:data toHost:@"192.168.1.10" port:6699 withTimeout:60 tag:-1];
}

-(void)askForAutomarchSettings{
    [self sendMessage:@"am?"];
}

-(void)askForAutomarchSettingsWithCompletionHandler:(void(^)(bool automarchState, NSNumber *automarchSpeed))completionHandler{
    self.automarchCompletionBlock = completionHandler;
    [self askForAutomarchSettings];
}

-(void)subscribeToMatrixUpdates{
    [self sendMessage:@"a!"];
}

-(void)unsubscribeFromMatrixUpdates{
    [self sendMessage:@"x!"];
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext
{
    NSString *raw = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if ([raw rangeOfString:@"am,"].location != NSNotFound) {
        NSArray *automarchArray = [raw componentsSeparatedByString:@","];
        if (automarchArray.count == 3) {
            NSString *automarchState = automarchArray[1];
            if ([automarchState isEqualToString:@"y"]) {
                self.automarchState = [NSNumber numberWithBool:YES];
            }else{
                self.automarchState = [NSNumber numberWithBool:NO];
            }
            
            NSString *automarchTimer = automarchArray[2];
            self.automarchSpeed = [NSNumber numberWithInteger:automarchTimer.integerValue];
            if (self.automarchCompletionBlock) {
                self.automarchCompletionBlock(self.automarchState.boolValue, self.automarchSpeed);
            }
        }
    }else{
        NSArray *msgArray = [raw componentsSeparatedByString:@"\n"];
        self.mostRecentMatrix = raw;
        for (NSString *msg in msgArray){
            NSArray *msgComponents = [msg componentsSeparatedByString:@","];
            if (msgComponents.count == 5) {
                if (self.gridView) {
                    NSUInteger supergridColumn = 0;
                    if ([(NSString*)msgComponents[0] integerValue] > 15) {
                        supergridColumn = 1;
                    }
                    NSUInteger gridIntegerArray[] = {0, supergridColumn, [(NSString *)msgComponents[1] integerValue], [(NSString *)msgComponents[0] integerValue]};
                    if (supergridColumn == 1) {
                        NSLog(@"%@", msgComponents);
                        gridIntegerArray[3] = gridIntegerArray[3]-16;
                    }
                    NSIndexPath *gridIndexPath = [NSIndexPath indexPathWithIndexes:gridIntegerArray length:4];
                    MSGridViewCell *cell = [self.gridView cellAtIndexPath:gridIndexPath];
                    UIColor *color = [UIColor colorWithRed:[(NSString *)msgComponents[2] doubleValue]/255.0f
                                                     green:[(NSString *)msgComponents[3] doubleValue]/255.0f
                                                      blue:[(NSString *)msgComponents[4] doubleValue]/255.0f
                                                     alpha:1.0];
                    cell.backgroundColor = color;
                }
            }
        }
    }
}

@end
