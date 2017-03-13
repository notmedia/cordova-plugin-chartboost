#import <Cordova/CDV.h>
#import <Chartboost/Chartboost.h>

@interface ChartboostPlugin : CDVPlugin

@property NSString *callbackId;
@property BOOL showRewardedVideo;
@property BOOL completeRewardedVideo;


- (void) startWithAppId:(CDVInvokedUrlCommand*) command;
- (void) setCustomId:(CDVInvokedUrlCommand*) command;
- (void) downloadRewardedVideo:(CDVInvokedUrlCommand*) command;
- (void) showRewardedVideo:(CDVInvokedUrlCommand*) command;

//Delegates
- (void)didCacheRewardedVideo:(CBLocation)location;
- (void)didFailToLoadRewardedVideo:(CBLocation)location
                         withError:(CBLoadError)error;
- (BOOL)shouldDisplayRewardedVideo:(CBLocation)location;
- (void)didCompleteRewardedVideo:(CBLocation)location
                      withReward:(int)reward;
- (void)didCloseRewardedVideo:(CBLocation)location;

@end
