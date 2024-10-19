
import 'package:farmlancer/home_page.dart';
import 'package:farmlancer/services/auth_provider.dart';
import 'package:farmlancer/services/perms.dart';
import 'package:farmlancer/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Perms.notification();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  static final navigatorKey = GlobalKey<NavigatorState>();
    @override
  void initState() {
    super.initState();
    subscribe();
    _handleInteractionWithNotification();
  }
  @override
  Widget build(BuildContext context) {
    // String? screen;
    // OneSignal.Notifications.addClickListener((event) {
    //   final data = event.notification.additionalData;
    //   screen = data?['screen'];
    //   if (screen != null) {
    //     navigatorKey.currentState?.pushNamed(screen!);
    //   }
    // });
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
        child: MaterialApp(
            title: 'Farmlancer',
            navigatorKey: navigatorKey,
            //initialRoute: '/homepage',
            //routes: {
            //  '/homepage': (context) => const HomePage(),
            //},
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: Splash_Screen()));
  }
  void subscribe() {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
});

  messaging.subscribeToTopic("all");
  print("Subscribe to all topic");
}
void _handleInteractionWithNotification() {
  FirebaseMessaging.onMessageOpenedApp.listen((_) {
    // Navigate to a designated screen upon interaction with the notification
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
});
}
}