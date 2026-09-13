class User {
  String _name;
  String _email;
  User(this._name, this._email);
  User.withDetails(String name, String email) : _name = name, _email = email;

  String getName() => _name;
  String getEmail() => _email;

  void setName(String newName) {
    if (newName.isEmpty) {
      print('Name cant be empty!');
      return;
    }
    _name = newName;
  }

  void setEmail(String newEmail) {
    if (!newEmail.contains('@')) {
      print('unvalid email');
      return;
    }
    _email = newEmail;
  }
}

class Admin extends User {
  String _level;

  Admin(String name, String email, String level)
    : _level = level,
      super(name, email);

  @override
  String toString() {
    return 'Admin -> ${getName()} (${getEmail()}), level: $_level';
  }

  void banUser(User user) {
    print('${getName()} has banned ${user.getName()}!');
  }
}

abstract class Animal {
  String name;

  Animal(this.name);
  void makeSound();
}

class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print('$name says: Woof woof!');
  }
}

class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print('$name says: Meow!');
  }
}

class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, [this.quantity = 1]);

  double getTotal() {
    return price * quantity;
  }

  @override
  String toString() {
    return '$name - Rs.$price x $quantity';
  }
}

class ShoppingCart {
  List<Product> _products = [];

  void addProduct(Product p) {
    _products.add(p);
    print('Added ${p.name} to cart');
  }

  void removeProduct(String name) {
    for (int i = 0; i < _products.length; i++) {
      if (_products[i].name == name) {
        _products.removeAt(i);
        print('Removed $name');
        return;
      }
    }
    print('$name not found in cart');
  }

  double calculateTotal() {
    double total = 0;
    for (int i = 0; i < _products.length; i++) {
      total = total + _products[i].getTotal();
    }
    return total;
  }

  void showCart() {
    print('--- Cart ---');
    if (_products.isEmpty) {
      print('(nothing here)');
      return;
    }
    for (int i = 0; i < _products.length; i++) {
      print('  ${i + 1}. ${_products[i]}');
    }
    print('--- end ---');
  }
}

void main() {
  print('User class');
  User u1 = User('sohaiba qaddus', 'sohaibaqaddus01@gmail.com');
  print('User name: ${u1.getName()}');
  print('User email: ${u1.getEmail()}');

  u1.setName('shahid');
  print('New name: ${u1.getName()}');

  u1.setEmail('error-email');

  print('Named constructor');
  User u2 = User.withDetails('Sania', 'saniawishaal01@gmail.com');
  print('User 2: ${u2.getName()} - ${u2.getEmail()}');

  print('Admin test');
  Admin a1 = Admin('manager', 'manager01@company.com', 'super');
  print(a1);
  a1.banUser(u1);

  print('Animals');
  Dog d = Dog('rio');
  Cat c = Cat('tutu');
  d.makeSound();
  c.makeSound();

  print('All animals in a list');
  List<Animal> myAnimals = [];
  myAnimals.add(Dog('chow chow'));
  myAnimals.add(Cat('lilly'));
  myAnimals.add(Dog('baddy'));

  for (int i = 0; i < myAnimals.length; i++) {
    myAnimals[i].makeSound();
  }

  ShoppingCart cart = ShoppingCart();

  cart.addProduct(Product('Laptop', 67000));
  cart.addProduct(Product('Mouse', 1000, 7));
  cart.addProduct(Product('Keyboard', 5000));

  cart.showCart();
  print('Total: Rs. ${cart.calculateTotal()}');

  print('\nRemoving Mouse...');
  cart.removeProduct('Mouse');
  cart.showCart();
  print('Total now: Rs. ${cart.calculateTotal()}');
}
