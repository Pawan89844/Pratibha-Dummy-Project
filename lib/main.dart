import 'package:flutter/material.dart';
import 'package:pratibha/model/signup_auth.dart';
import 'package:pratibha/screen/home_page.dart';
import 'package:pratibha/screen/page/login.dart';
import 'package:pratibha/screen/page/signup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => SignUpAuth(),
        ),
      ],
      child: Consumer<SignUpAuth>(
          builder: (ctx, auth, _) => MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                    tabBarTheme: TabBarTheme(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                            )))),
                home: auth.isAuth ? HomePage() : LoginScreen(),
              )),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(tabs: [
                Tab(
                  text: 'Login',
                ),
                Tab(
                  text: 'SignUp',
                ),
              ]),
            ),
            body: TabBarView(children: [
              Login(),
              Signup(),
            ]),
          )),
    );
  }
}
