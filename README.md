# cordova-plugin-chartboost
Chartboost ads for Apache Cordova

###### WARNING: This plugin available only for iOS.

# Install plugin

```
$ cordova plugin add cordova-plugin-chartboost
```

# Methods

#### Chartboost.startWithAppId(appID, appSignature)
Initial method wich connect to Chartboost.  
(string) appID - the appID of your app in Tapjoy Dashboard.  
(string) appSignature - the appKey of your app in Tapjoy Dashboard.

#### Chartboost.setCustomId(customID)
Set a custom identifier to send in the POST body for all Chartboost API server requests.  
(string) customID

#### Chartboost.downloadRewardedVideo() 
Downloads rewarded video.  

#### Chartboost.showRewardedVideo()
Show rewarded video, when success event was emitted.  

# Events

```js
document.addEventListener('didCacheRewardedVideo', (data) => {  
  console.log('Chartboost: cached rewarded video.');
});
```
```js
document.addEventListener('didFailToLoadRewardedVideo', (data) => {
 console.log('Chartboost: failed to load rewarded video.');
});
```
```js
document.addEventListener('didCompleteRewardedVideo', (error) => {
  console.log('Chartboost: complete rewarded video.');
});
```

# Example

```js
let appID = 'MyAppID';
let appSignature = "MyAppSignature";

Chartboost.startWithAppId(appID, appSignature);
Chartboost.downloadRewardedVideo();

document.addEventListener('didCacheRewardedVideo', (data) => {  
  Chartboost.showRewardedVideo();
});

document.addEventListener('didFailToLoadRewardedVideo', (data) => {
 console.log('Chartboost: failed to load rewarded video.');
});

document.addEventListener('didCompleteRewardedVideo', (error) => {
  console.log('Chartboost: complete rewarded video.');
});
```

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QVU9KQVD2VZML)