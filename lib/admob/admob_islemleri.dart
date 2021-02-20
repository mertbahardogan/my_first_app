import 'package:firebase_admob/firebase_admob.dart';

class AdmobIslemleri {
  static final String appIdCanli = "ca-app-pub-3430256037879691~9194949650";
  static final String appIdTest = FirebaseAdMob.testAppId;

  static int gosterimSayac = 0;

  static final String bannerIdCanli = "ca-app-pub-3430256037879691/4170047203";

  static final String gecisIdCanli = "ca-app-pub-3430256037879691/1248440203";

  static final String odulIdCanli = "ca-app-pub-3430256037879691/1804448757";
  static final String odulIdTest = RewardedVideoAd.testAdUnitId;

  static int odulSayac = 0;

  static admobInitialize() {
    FirebaseAdMob.instance.initialize(appId: appIdTest);
  }

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutter', 'fit child app'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  static BannerAd buildBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
        if (event == MobileAdEvent.loaded) {
          print("Banner yüklendi.");
        }
      },
    );
  }

  static InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }
}
