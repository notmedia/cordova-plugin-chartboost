#import "ChartboostPlugin.h"

@implementation ChartboostPlugin

@synthesize callbackId;
@synthesize showRewardedVideo;
@synthesize completeRewardedVideo;

- (void) startWithAppId: (CDVInvokedUrlCommand*) command{
    [Chartboost startWithAppId:[command.arguments objectAtIndex:0]
                  appSignature:[command.arguments objectAtIndex:1]
                      delegate:self];
    [Chartboost setAutoCacheAds:true];
}

- (void) setCustomId:(CDVInvokedUrlCommand*)command{
    [Chartboost setCustomId:[command.arguments objectAtIndex:0]];
}

- (void) downloadRewardedVideo:(CDVInvokedUrlCommand*) command{
    self.callbackId = command.callbackId;
    if([Chartboost hasRewardedVideo:CBLocationMainMenu]) {
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                          messageAsString:@"didCacheRewardedVideo"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
    }
    else {
        [Chartboost cacheRewardedVideo:CBLocationMainMenu];
    }
}

- (void) showRewardedVideo:(CDVInvokedUrlCommand*) command{
    self.callbackId = command.callbackId;
    self.showRewardedVideo = true;
    [Chartboost showRewardedVideo:CBLocationMainMenu];
}


- (void)didCacheRewardedVideo:(CBLocation)location{
    if (!self.showRewardedVideo){
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                          messageAsString:@"didCacheRewardedVideo"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
    };
}

- (void)didFailToLoadRewardedVideo:(CBLocation)location
                         withError:(CBLoadError)error{
    if (!self.showRewardedVideo){
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                          messageAsString:@"didFailToLoadRewardedVideo"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
    };
}

- (BOOL)shouldDisplayRewardedVideo:(CBLocation)location{
    self.completeRewardedVideo = false;
    return true;
}

- (void)didCompleteRewardedVideo:(CBLocation)location
                      withReward:(int)reward{
    self.completeRewardedVideo = true;
}

- (void)didCloseRewardedVideo:(CBLocation)location{
    self.showRewardedVideo = false;
    NSDictionary *dictionary = @{@"message" : @"didCloseRewardedVideo",
                                 @"didCompleteRewardedVideo"  : @(self.completeRewardedVideo)};
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                  messageAsDictionary:(dictionary)];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
}

@end