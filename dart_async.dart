import 'dart:async';

Future<void> delay(int ms) => Future.delayed(Duration(milliseconds: ms));

Future<void> main() async {
  print('Fetch user data');
  await fetchUser();

  print('Error handling');
  await errorHandling();

  print(' Parallel requests with Future.wait ');
  await parallel();

  print(' Stream with await for');
  await streamDemo();

  print(' Stream errors ');
  await streamError();

  print('StreamController manually ');
  await streamControllerDemo();

  print('Stream transformation');
  await streamTransform();

  print('All async demos complete');
}

Future<String> fetchUserData() async {
  print('  [fetchUserData] contacting server...');
  await delay(2000);
  return 'User: sohaiba, Email: sohaibaqaddus01@gmail.com';
}

Future<void> fetchUser() async {
  print('  Calling fetchUserData()...');
  String result = await fetchUserData();
  print('  Got: $result');
}

Future<String> fetchUserDataWithError() async {
  await delay(500);
  throw Exception('Server is down!');
}

Future<void> errorHandling() async {
  try {
    print('  Trying to fetch user...');
    String result = await fetchUserDataWithError();
    print('  Success: $result');
  } catch (m) {
    print('  Caught error: $m');
  } finally {
    print('  Done');
  }
}

Future<String> fetchUserInfo() async {
  await delay(900);
  return 'User: sohaiba';
}

Future<String> fetchOrders() async {
  await delay(1500);
  return 'Orders: 7 items';
}

Future<String> fetchNotifications() async {
  await delay(700);
  return 'Notifications: 7 new';
}

Future<void> parallel() async {
  print('  Starting it');
  final stopwatch = Stopwatch()..start();

  List<String> results = await Future.wait([
    fetchUserInfo(),
    fetchOrders(),
    fetchNotifications(),
  ]);

  stopwatch.stop();
  print('  All results:');
  for (String u in results) {
    print('    - $u');
  }
  print('  Took ${stopwatch.elapsedMilliseconds} ms');
  print('  (Without Future.wait, it would take 7000 ms)');
}

Stream<int> counterStream() async* {
  for (int i = 1; i <= 10; i++) {
    await delay(600);
    yield i;
  }
}

Future<void> streamDemo() async {
  print('  counterStream');
  await for (int value in counterStream()) {
    print('  Received: $value');
  }
  print('  Stream finished');
}

Stream<int> brokenStream() async* {
  yield 1;
  yield 2;
  throw Exception('Stream failed at value 2!');
}

Future<void> streamError() async {
  try {
    await for (int value in brokenStream()) {
      print('  Received: $value');
    }
  } catch (m) {
    print('  Caught stream error: $m');
  }
}

Future<void> streamControllerDemo() async {
  final controller = StreamController<String>();

  final subscription = controller.stream.listen(
    (data) => print('  Listener got: $data'),
    onDone: () => print('  Stream closed'),
    onError: (err) => print('  Stream error: $err'),
  );

  controller.add('first event');
  await delay(300);
  controller.add('second event');
  await delay(300);
  controller.add('third event');
  await delay(300);

  await controller.close();
  await subscription.cancel();
}

Stream<int> numberStream() async* {
  for (int i = 1; i <= 5; i++) {
    await delay(170);
    yield i;
  }
}

Future<void> streamTransform() async {
  print('  Transforming stream: keep evens, double them, take first 3');
  final transformed = numberStream()
      .where((n) => n % 2 == 0)
      .map((n) => n * 2)
      .take(3);

  await for (int value in transformed) {
    print('  Transformed value: $value');
  }
}
