import 'package:aya_dazani/Models/Informations.dart';
import 'package:aya_dazani/Screens/Splash_Screen.dart';
import 'package:aya_dazani/Screens/noInternet_Screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:provider/provider.dart';
import 'package:native_notify/native_notify.dart';
import 'package:uuid/uuid.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool firstRun = await IsFirstRun.isFirstRun();
  print(firstRun);
  var uuid = Uuid();
  var u;
  if(firstRun)
  u = uuid.v4();
 print(u);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  NativeNotify.initialize(
      1673,
      'Oa7rqUho48jubzF00qHbY0',
      "AAAAW1deEdA:APA91bHbd9KhSGEY0Mv-qtOpjObzGJZudoPmFRKnfM3Of_imXesniEHg21Ev-nM4M1yXORqtE_GzbaO2w9gsiaLgxsjP39lzODKX3CUqUk9cAuVZpu46AuxowBjphI3rddnU_KutxGPJ",
      null);
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    runApp(noInternet_Screen());
  } else {
    runApp(ChangeNotifierProvider(
        create: (_) => Informations(id: '', image: '', information: ''),
        child: MyApp()));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splah_Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}