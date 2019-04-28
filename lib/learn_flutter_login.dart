import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'User login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TestFocusRoute();
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('User login'),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            TestFocusRoute(),
//            TextField(
//              autofocus: true,
//              decoration: InputDecoration(
//                labelText: 'Username',
//                hintText: 'Username or Email',
//                prefixIcon: Icon(Icons.person)
//              ),
//              controller: _usernameController,
//              onChanged: (v) {
//                print('onChanged: $v');
//              },
//            ),
//            TextField(
//              decoration: InputDecoration(
//                labelText: 'Password',
//                hintText: 'Your password',
//                prefixIcon: Icon(Icons.lock)
//              ),
//              obscureText: true,
//            )
//          ],
//        ),
//      ),
//    );
  }
}

class TestFocusRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestFocusRouteState();
  }
}

class _TestFocusRouteState extends State<TestFocusRoute> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Focus'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Username or Email',
                    icon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : 'Username CANNOT empty!';
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Your password',
                    icon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                  validator: (v) {
                    return v.trim().length > 5 ? null : 'Password CANNOT less 6 digits';
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text('Login'),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              if ((_formKey.currentState as FormState).validate()) {
                                // submit data
                              }
                            }
                            ),
                      )
                    ],
                  ),
                )
              ],
            )),),
    );
  }
}

//class _TestFocusRouteState extends State<TestFocusRoute> {
//  FocusNode node1 = new FocusNode();
//  FocusNode node2 = new FocusNode();
//  FocusScopeNode focusScopeNode;
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Padding(
//      padding: EdgeInsets.all(16.0),
//      child: Column(
//        children: <Widget>[
//          TextField(
//            autofocus: true,
//            focusNode: node1,
//            decoration: InputDecoration(
//              labelText: 'input1'
//            ),
//          ),
//          TextField(
//            focusNode: node2,
//            decoration: InputDecoration(
//              labelText: 'input2',
//            ),
//          ),
//          Builder(
//            builder: (ctx) {
//              return Column(
//                children: <Widget>[
//                  RaisedButton(
//                    child: Text('移动焦点'),
//                    onPressed: () {
//                      if (focusScopeNode == null) {
//                        focusScopeNode = FocusScope.of(context);
//                      }
//                      focusScopeNode.requestFocus(node2);
//                    },
//                  ),
//                  RaisedButton(
//                    child: Text('隐藏键盘'),
//                    onPressed: () {
//                      node1.unfocus();
//                      node2.unfocus();
//                    },
//                  ),
//                ],
//              );
//            },
//          )
//        ],
//      ),
//    );
//  }
//}