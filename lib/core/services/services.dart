import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:med_booking_system/firebase_options.dart';


class MyServices extends GetxService {
  final box = GetStorage();
  Future<MyServices> init() async {
    await GetStorage.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    //   options: const FirebaseOptions(
    //     apiKey:
    //         "AIzaSyD4PU3-ToddNC-bwLN-bBz57PntWREkIMo", // paste your api key here
    //     appId:
    //         "1:993384230410:android:62ac7f73cb032acc7f79f3", //paste your app id here
    //     messagingSenderId: "993384230410", //paste your messagingSenderId here
    //     projectId: "med-booking-system", //paste your project id here
    //   ),
     );
     FirebaseMessaging.instance.getToken().then((value) {
      String? device_token = value;
            print("====================================device_token=============================================");
      print(device_token);
    });
    return this;
  }
}
initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
