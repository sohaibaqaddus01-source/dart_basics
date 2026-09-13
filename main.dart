void variables() {
  var name = '';
  name = 'sohaiba qaddus';
  print('name =$name');
  final now = DateTime.now();
  print('final now = $now');
  const pi = 3.141;
  print('const pi = $pi');
}

void datatype() {
  int age = 23;
  double price = 29.99;
  String name = 'abdul qaddus';
  bool isLearning = true;
  print('int age = $age');
  print('double price =$price');
  print('string name = $name');
  print('bool isLaerning = $isLearning');
}

void ifelse() {
  int marks = 90;
  if (marks > 80) {
    print('highest number');
  } else if (marks > 70) {
    print('moderate number');
  } else {
    print('lowest number');
  }
  String status = marks >= 99 ? 'highest number' : 'lowest number';
  print('status: $status');
}

void Forloop() {
  print('washing machine');
  for (int i = 1; i <= 5; i++) {
    print('i = $i');
  }
  print('start a washing machine:');
  final spinner = ['cloth 1', 'cloth 2', 'cloth 3'];
  for (final cloth in spinner) {
    print('$cloth');
  }
}

void whileloop() {
  int tasbeeh = 0;
  print('zikr completed to 10');
  while (tasbeeh < 10) {
    print('count = $tasbeeh');
    tasbeeh++;
  }
  int steps = 20;
  print('take steps at least once');
  do {
    print('steps = $steps');
    steps++;
  } while (steps < 15);
}

int sum(int a, int b) {
  return a + b;
}

int factorial(int n) {
  if (n < 0) {
    throw ArgumentError('factorial is not defined for negative numbers');
  }
  if (n == 0 || n == 1) return 1;
  return n * factorial(n - 1);
}

bool isPrime(int n) {
  if (n <= 1) return false;
  if (n <= 3) return true;
  if (n % 2 == 0 || n % 3 == 0) return false;

  for (int i = 5; i * i <= n; i += 6) {
    if (n % i == 0 || n % (i + 2) == 0) return false;
  }
  return true;
}

void main() {
  print('variables');
  variables();
  print('datatypes');
  datatype();
  print('if-else');
  ifelse();
  print('for loop');
  Forloop();
  print('add the number');
  print('sum =${sum(8, 4)}');
  print('Recursion: factorial(n)');
  for (int i = 0; i <= 6; i++) {
    print('factorial($i) = ${factorial(i)}');
  }

  print('isPrime(n)');
  for (int i = 1; i <= 20; i++) {
    if (isPrime(i)) print('$i is prime');
  }
}
