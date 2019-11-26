import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Auth Check'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   SharedPreferences prefs;

  /// Attributes for Azure B2C ///
  final clientId = 'b776705b-29e9-4b80-9c5f-4ccee78a7fef';
  final redirectURL = 'com.imaginecup.prodplatform://oauthredirect';
  final discoveryURL =
      'https://prodplatform.b2clogin.com/prodplatform.onmicrosoft.com/v2.0/.well-known/openid-configuration?p=B2C_1_SignUpSignIn';
  final List<String> scopes = ['openid', 'profile',];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    FlutterAppAuth _appauth = FlutterAppAuth();
    AuthorizationTokenResponse result;
    try{
    result = await _appauth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(clientId, redirectURL,
          //issuer: "https://prodplatform.b2clogin.com/ccab738-09c1-45df-8aca-7c17c285b689/v2.0/",
          discoveryUrl: discoveryURL,
          scopes: scopes),
    );
    }
    catch(e){
      print(e.toString());
    }
    // final Config config = new Config(
    //     "cc0ab738-09c1-45df-8aca-7c17c285b689",
    //     clientId,
    //     "openid offline_access",
    //     redirectURL);
    // final AadOAuth oauth = new AadOAuth(config);
    // await oauth.login();
    // String result = await oauth.getAccessToken();


    prefs = await SharedPreferences.getInstance();
    while (prefs == null || result == null) continue;
    setState(() {
      prefs.setString('token', result.idToken);
    });
    //print(result);


  
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Text(
              'Test',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
