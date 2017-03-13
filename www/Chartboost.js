var Chartboost = {
  startWithAppId: function(appID, appSignature) {
    cordova.exec(null, null, 'ChartboostPlugin', 'startWithAppId', [appID, appSignature]);
  },
  setCustomId: function(customId) {
    cordova.exec(null, null, 'ChartboostPlugin', 'setCustomId', [customId]);
  },
  downloadRewardedVideo: function() {
    cordova.exec(function(result) {
      if (result === "didCacheRewardedVideo") {
        cordova.fireDocumentEvent('didCacheRewardedVideo');
      }
      else {
        cordova.fireDocumentEvent('didFailToLoadRewardedVideo');
      }
    }, null, 'ChartboostPlugin', 'downloadRewardedVideo', []);
  },
  showRewardedVideo: function() {
    cordova.exec(function(result) {
      if (result.message === "didCloseRewardedVideo") {
        if (result.didCompleteRewardedVideo) {
          cordova.fireDocumentEvent('didCompleteRewardedVideo');
        }
      }
    }, null, 'ChartboostPlugin', 'showRewardedVideo', []);
  }
};

module.exports = Chartboost;
