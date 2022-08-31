import 'package:aya_dazani/Screens/Splash_Screen.dart';
import 'package:aya_dazani/Services/local_notifications.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> backroundHandler(RemoteMessage message) async {
  print(" This is message from background");
  print(message.notification!.title);
  print(message.notification!.body);
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //    // name: "aya-dazani",
  //     options: FirebaseOptions(
  //         apiKey: "xxx",
  //         appId: "xxx",
  //         messagingSenderId: "xxx",
  //         projectId: "xxx")); 
  await Firebase.initializeApp();   
  FirebaseMessaging.onBackgroundMessage(backroundHandler);
  final connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.none) {
  runApp(app());
} else {
  runApp(MyApp());
}
  
}

class app extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Image.asset("assets/noconection.webp", width: double.infinity, height: double.infinity,),
      ),
    );
  }
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String notificationMsg = "Waiting for notifications";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LocalNotificationService.initilize();

    //Terminated State
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        setState(() {
          notificationMsg =
              "${event.notification!.title} ${event.notification!.body} I am coming from terminated state";
        });
      }
    });

    // Foregrand State
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.showNotificationOnForeground(event);
      setState(() {
        notificationMsg =
            "${event.notification!.title} ${event.notification!.body} I am coming from foreground";
      });
    });

    // background State
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        notificationMsg =
            "${event.notification!.title} ${event.notification!.body} I am coming from background";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splah_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}