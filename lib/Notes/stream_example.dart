// ignore_for_file: avoid_print

// ASYNCHRONOUS SENDING INT IN EVERY 2 SEC
Stream<int> boatStream() async* {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}

void main() {
  Stream<int> boats = boatStream();

  // LISTEN CALL BACK FOR EACH ITEM RECEIVED
  boats.listen((data) {
    print("receive: $data");
  });
}
