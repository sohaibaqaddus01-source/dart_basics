void listOperations() {
  List<int> numbers = [88, 90, 99];
  print('starting list: $numbers');

  numbers.add(56);
  print('add: $numbers');

  numbers.insert(0, 9);
  print('insert: $numbers');

  numbers.addAll([76, 83]);
  print('addAll:$numbers');

  numbers.remove(99);
  print('remove: $numbers');

  numbers.removeAt(0);
  print('removeAt: $numbers');

  numbers.removeLast();
  print('removeLast:   $numbers');

  print('First element:  ${numbers.first}');
  print('Last element:  ${numbers.last}');
  print('Length:   ${numbers.length}');
}

void setOperations() {
  Set<int> numbers = {10, 20, 30, 36, 40, 40, 58};
  print('Set (duplicates removed automatically): $numbers');
  print('Length: ${numbers.length}');

  numbers.add(6);
  numbers.add(1);
  print('After add(6) and add(1): $numbers');

  numbers.remove(40);
  print('After remove(3): $numbers');
  print('Contains 4? ${numbers.contains(40)}');
  print('Contains 99? ${numbers.contains(55)}');

  Set<int> a = {4, 7, 9, 11};
  Set<int> b = {13, 22, 55, 69};
  print('A = $a, B = $b');
  print('Union:        ${a.union(b)}');
  print('Intersection: ${a.intersection(b)}');
  print('Difference:   ${a.difference(b)}');
}

void mapOperations() {
  Map<String, int> ages = {'sohaiba': 23, 'bushra': 39, 'faris': 30};
  print('starting map: $ages');

  print("sohaiba age: ${ages['sohaiba']}");

  ages['maria'] = 22;
  print('After adding maria: $ages');

  ages['bushra'] = 40;
  print('After updating bushra: $ages');

  ages.remove('faris');
  print('After removing faris: $ages');

  print('Keys:   ${ages.keys.toList()}');
  print('Values: ${ages.values.toList()}');
  print('Entries: ${ages.entries.toList()}');

  print('Looping with forEach:');
  ages.forEach((name, age) => print('  $name is $age years old'));
}

void mapTransformation() {
  List<int> numbers = [6, 11, 22, 33, 55];
  print('Original: $numbers');

  List<int> squares = numbers.map((n) => n * n).toList();
  print('Squares:  $squares');

  List<int> doubled = numbers.map((n) => n * 2).toList();
  print('Doubled:  $doubled');

  List<String> labels = numbers.map((n) => 'Item $n').toList();
  print('Labels:   $labels');

  List<String> names = ['alice', 'bob', 'charlie'];
  List<String> capitalized = names
      .map((n) => n[0].toUpperCase() + n.substring(1))
      .toList();
  print('Names:        $names');
  print('Capitalized:  $capitalized');
}

void whereFilteration() {
  List<int> numbers = [9, 32, 86, 25, 30, 12, 70, 60];
  print('Original: $numbers');

  List<int> evens = numbers.where((n) => n % 2 == 0).toList();
  print('Evens:  $evens');

  List<int> greaterThan10 = numbers.where((n) => n > 12).toList();
  print('> 17:   $greaterThan10');

  List<int> range = numbers.where((n) => n >= 9 && n <= 70).toList();
  print('9 to 70:  $range');

  List<String> words = ['make', 'cake', 'fast', 'lovely', 'pie'];
  List<String> shortWords = words.where((w) => w.length <= 4).toList();
  print('Words: $words');
  print('Short : $shortWords');
}

void reduce() {
  List<int> numbers = [17, 20, 37, 66, 57];
  print('Numbers: $numbers');

  int total = numbers.reduce((a, b) => a + b);
  print('Sum: $total');

  int product = numbers.reduce((a, b) => a * b);
  print('Product: $product');

  int max = numbers.reduce((a, b) => a > b ? a : b);
  print('Max: $max');

  int min = numbers.reduce((a, b) => a < b ? a : b);
  print('Min: $min');

  int sumPlus6 = numbers.fold(6, (a, b) => a + b);
  print('Sum: $sumPlus6');
}

void studentManagementSystem() {
  List<Map<String, dynamic>> students = [];

  students.add({'name': 'faria', 'roll': 1, 'marks': 99});
  students.add({'name': 'sana', 'roll': 2, 'marks': 88});
  students.add({'name': 'alina', 'roll': 3, 'marks': 80});
  students.add({'name': 'sahib', 'roll': 4, 'marks': 76});
  students.add({'name': 'hina', 'roll': 5, 'marks': 51});

  print('Total students: ${students.length}');

  List<Map<String, dynamic>> sorted = List.from(students);
  sorted.sort((a, b) => (b['marks'] as int).compareTo(a['marks'] as int));

  print('Students sortion');
  printStudentTable(sorted);

  List<Map<String, dynamic>> topPerformers = students
      .where((s) => (s['marks'] as int) > 78)
      .toList();

  print('Students marks greater than 75');
  printStudentTable(topPerformers);

  print('Search student by name ');
  searchStudent(students, 'sahib');
  searchStudent(students, 'wahad');

  print('All students (forEach)');
  students.forEach((s) {
    print('  ${s['name']} (Roll ${s['roll']}) — ${s['marks']} marks');
  });

  print('Class Statistics');
  int total = students.map((s) => s['marks'] as int).reduce((a, b) => a + b);
  double average = total / students.length;
  int highest = students
      .map((s) => s['marks'] as int)
      .reduce((a, b) => a > b ? a : b);
  int lowest = students
      .map((s) => s['marks'] as int)
      .reduce((a, b) => a < b ? a : b);

  print('Total marks: $total');
  print('Average:     ${average.toStringAsFixed(2)}');
  print('Highest:     $highest');
  print('Lowest:      $lowest');
}

void printStudentTable(List<Map<String, dynamic>> students) {
  print('---------------------------');
  print('| Name  | Roll    | Marks |');
  print('---------------------------');
  for (var s in students) {
    final name = (s['name'] as String).padRight(5);
    final roll = (s['roll'] as int).toString().padRight(7);
    final marks = (s['marks'] as int).toString().padRight(5);
    print('| $name | $roll | $marks |');
  }
  print('---------------------------');
}

void searchStudent(List<Map<String, dynamic>> students, String name) {
  final result = students
      .where((s) => (s['name'] as String).toLowerCase() == name.toLowerCase())
      .toList();

  if (result.isEmpty) {
    print("Student '$name' not found.");
  } else {
    final s = result.first;
    print("Found: ${s['name']} — Roll ${s['roll']} — Marks ${s['marks']}");
  }
}

void main() {
  print('list operation');
  listOperations();

  print('set operation');

  setOperations();

  print('map operation');

  mapOperations();

  print('transform data');

  mapTransformation();

  print('filtering');

  whereFilteration();

  print('sum');

  reduce();

  print('student management system');

  studentManagementSystem();
}
