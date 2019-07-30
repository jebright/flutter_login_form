import 'package:flutter/material.dart';

//Photo by Cagatay Orhan on Unsplash

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Image logo() {
    return Image.asset('assets/logo.png', height: 60);
  }

  TextFormField username() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Username',
        labelText: 'Username',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    );
  }

  TextFormField password() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      obscureText: true,
    );
  }

  RaisedButton loginButton() {
    return RaisedButton(
      child: const Text('LOGIN'),
      color: Colors.white.withOpacity(0.6),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0)),
      elevation: 4.0,
      splashColor: Theme.of(context).primaryColor,
      onPressed: () {
        // Perform some action
      },
    );
  }

  FlatButton signUpButton() {
    return FlatButton(
      onPressed: () {
        // Perform some action
      },
      child: Text(
        "DON'T HAVE AN ACCOUNT? SIGN UP",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget body(BuildContext context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait)
    {
      return portrait();
    }
    else {
      return landscape();
    }
  }

  Widget portrait() {
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new ExactAssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          //make labels and border white when not focused
          hintColor: Colors.white,
          textTheme: TextTheme(
              //make text value white
              body1: TextStyle(color: Colors.white)),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: logo(),
                  margin: EdgeInsets.symmetric(vertical: 30),
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Expanded(
                child: Container(
                  child: username(),
                  alignment: Alignment.bottomCenter,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: password(),
                  margin: EdgeInsets.only(top: 12),
                  alignment: Alignment.topCenter,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: loginButton(),
                  alignment: Alignment.topCenter,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: signUpButton(),
                  alignment: Alignment.bottomCenter,
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget landscape() {
    return new Stack(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new ExactAssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 80),
          child: logo(),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            //make labels and border white when not focused
            hintColor: Colors.white,
            textTheme: TextTheme(
                //make text value white
                body1: TextStyle(color: Colors.white)),
          ),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: username(),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: password(),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: loginButton(),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: signUpButton(),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context)
    );
  }
}
