//* Covairant == Parameters have their static types ignored during static checking. This prevents static errors, but can lead to runtime errors if we’re not careful.
//* example#1 - Covariant Parameters

void main() {}

abstract class Animal {
  void chase(Animal animal);
}

class Mouse extends Animal {
  @override
  void chase(Animal animal) {
    // TODO: implement chase
  }
  // void chase(Mouse mouse) {}
}

class Cat extends Animal {
  @override
  void chase(covariant Mouse animal) {}
}

//* example#2 - Add the covariant keyword to the variable you intend to modify.
class Human {
  void battle(covariant Human human) {
    // Animal chasing code here
  }
}

class Lawyer extends Human {}

class Programmer extends Human {
  @override
  void battle(covariant Lawyer human) {}
}
