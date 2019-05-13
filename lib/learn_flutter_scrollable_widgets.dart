import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter scrollable widgets',
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
    return TestScrollNotificationRoute();
  }
}

class TestSingleChildScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return Scaffold(
      appBar: AppBar(
        title: Text('Test SingleChildScrollView'),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: str.split('')
                    .map((c) => Text(c, textScaleFactor: 2.0,))
                    .toList(),
              ),
            ),
          ),
      ),
    );
  }
}

class TestListViewBuilder extends StatelessWidget {
  final Widget divider1 = Divider(color: Colors.blue,);
  final Widget divider2 = Divider(color: Colors.green,);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test ListView.separated'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text('$index'),);
          },
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
          },
        itemCount: 100,
      ),
    );

//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Test ListView.builder'),
//      ),
//      body: ListView.builder(
//        itemBuilder: (BuildContext context, int index) {
//          return ListTile(title: Text('$index'),);
//          },
//        itemCount: 100,
//        itemExtent: 50.0,
//      ),
//    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InfiniteListViewState();
  }
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '##loading##'; // 表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Infinite ListView'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            if (_words[index] == loadingTag) {
              if (_words.length - 1 < 100) {
                _retrieveData();
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0,),
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text('No more data', style: TextStyle(color: Colors.grey),),
                );
              }
            }
            return ListTile(title: Text(_words[index]),);
          },
          separatorBuilder: (context, index) => Divider(height: .0,),
          itemCount: _words.length),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      // 每次生成20个单词
      _words.insertAll(_words.length - 1, generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
    });
//    setState(() {
//      // 重新构建列表

//    });
  }
}

class TestGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test GridView'),
      ),
      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.0),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast),
          Icon(Icons.print),
          Icon(Icons.thumb_up),
          Icon(Icons.account_balance),
          Icon(Icons.add_a_photo),
          Icon(Icons.add_shopping_cart),
          Icon(Icons.airline_seat_legroom_extra),
          Icon(Icons.airplanemode_active),
          Icon(Icons.album),
          Icon(Icons.atm),
          Icon(Icons.book),
          Icon(Icons.brightness_3),
          Icon(Icons.child_friendly),
          Icon(Icons.departure_board),
        ],
      ),
    );
  }
}

class TestCustomScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('TestCustomScrollView'),
              background: Image.asset('images/dream_lake_colorado.png', fit: BoxFit.cover,),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.cyan[100 * (index % 9)],
                          child: Text('grid item $index'),
                        );
                        },
                  childCount: 20,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 4.0
                ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
          }, childCount: 50),
          ),
        ],
      ),
    );
  }
}

class TestScrollControllerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestScrollControllerRouteState();
  }
}

class _TestScrollControllerRouteState extends State<TestScrollControllerRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener(() {
//      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose(); // prevent OOM
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable control'),
      ),
      body: Scrollbar(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(title: Text('$index'),);
              },
            itemCount: 100,
            itemExtent: 50.0,
            controller: _controller,
          )
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo(.0, duration: Duration(microseconds: 200), curve: Curves.ease);
        },),
    );
  }
}

class TestScrollNotificationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestScrollNotificationRouteState();
  }
}

class _TestScrollNotificationRouteState extends State<TestScrollNotificationRoute> {
  String _progress = '0%';
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test ScrollNotification'),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
            setState(() {
              _progress = '${(progress * 100).toInt()}%';
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text('$index'),);
                  }),
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}