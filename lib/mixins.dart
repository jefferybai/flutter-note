
class A {
  a() {
    print('aa');
  }

  b() {
    print('ab');
  }

  c() {
    print('ac');
  }
}

class B {
  a() {
    print('ba');
  }

  b() {
    print('bb');
  }

  c() {
    print('bc');
  }
}

class C {
  a() {
    print('ca');
  }

  b() {
    print('cb');
  }

  c() {
    print('cc');
  }
}

// *with的类必须继承于Object
// 如果方法同名， 那么with关键字会从左至右覆盖前面前面class的方法

class F extends A with B, C {}




