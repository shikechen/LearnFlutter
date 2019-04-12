main() {
  var person = new Person("Chen", 25, "male");
  person.sayHello();

  person.age = 30;
  person.gender = "female";
  person.sayHello();

  var point = new Point.origin();
  var point2 = new Point(1, 2);

  Vector v1 = new Vector(1, 2);
  Vector v2 = new Vector(3, 4);
  (v1 - v2).printVec();
  (v1 + v2).printVec();

  C c = new C();
  c.a();
  c.b();

  Cons.sayHello();
  print(Cons.name);
}

class Cons {
  static const name = "Chen";
  static sayHello() {
    print("Hello, this is ${Cons.name}");
  }
}

class A {
  a() {
    print("A's a()");
  }
}

class B {
  b() {
    print("B's b()");
  }
}

class C = A with B; // 使用with关键字，表示类C是由类A和类B混合而构成  mixins

class Vector {
  num x, y;
  Vector(this.x, this.y);
  Vector operator +(Vector v) => new Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => new Vector(x - v.x, y - v.y);
  printVec() {
    print("x: $x, y: $y");
  }
}

abstract class Doer {
  void doSomething();
  void greet() {
    print("Hello Dart");
  }
}

class EffectiveDoer extends Doer {
  @override
  void doSomething() {
    // TODO: implement doSomething
    print("I'm learning Dart");
  }
}

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

class Human {
  String name;
  Human.fromJson(Map data) {
    print("Human's fromJson constructor");
  }
}

class Man extends Human {
  Man.fromJson(Map data) : super.fromJson(data) {
    print("Man's fromJson constructor");
  }
}

class Point {
  num x, y;
  Point(this.x, this.y);

  Point.origin() {
    x = 0;
    y = 0;
  }

  Point.alongXAxis(num x) : this(x, 0);
}

class Person {
  String name;
  int age;
  String gender;

  Person(this.name, this.age, this.gender);

  sayHello() {
    print("Hello, this is $name, I am $age years old, I am a $gender.");
  }
}