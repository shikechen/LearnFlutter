main() {
//  Future.delayed(new Duration(seconds: 2), (){
//    //return 'Hi Dart';
//    throw AssertionError('Error');
//  }).then((data){
//    print(data);
//  }).catchError((e){
//    print(e);
//  }).whenComplete((){
//    print('whenComplete');
//  });

//  Future.wait([
//    Future.delayed(new Duration(seconds: 2), (){
//      return 'Hello';
//    }),
//
//    Future.delayed(new Duration(seconds: 4), (){
//      return ' Dart Future';
//    })
//  ]).then((results){
//    print(results[0] + results[1]);
//  }).catchError((e){
//    print(e);
//  });

  Stream.fromFutures([
    Future.delayed(new Duration(seconds: 1), (){
      return 'Hello 1';
    }),

    Future.delayed(new Duration(seconds: 2), (){
      throw AssertionError('Error');
    }),

    Future.delayed(new Duration(seconds: 3), (){
      return 'Hello 3';
    })
  ]).listen((data){
    print(data);
  }, onError: (e){
    print(e.message);
  }, onDone: (){

  });
}