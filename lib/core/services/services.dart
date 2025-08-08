import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyServices extends GetxService {
  final box = GetStorage();
  Future<MyServices> init() async {
    await GetStorage.init();
    // await Firebase.initializeApp(
    //   options: const FirebaseOptions(
    //     apiKey:
    //         "AIzaSyC5uFk5t93WpIaecTtrbVM0FcTTlhZS748", // paste your api key here
    //     appId:
    //         "1:136062004556:android:81acac55278dcafcca73e9", //paste your app id here
    //     messagingSenderId: "136062004556", //paste your messagingSenderId here
    //     projectId: "jobsapp-ea72c", //paste your project id here
    //   ),
    //  );
    //  FirebaseMessaging.instance.getToken().then((value) {
    //   String? device_token = value;
    //         print("device_token");
    //   print(device_token);
    // });
    return this;
  }
}
initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
