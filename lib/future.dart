//* example 3
void main() {
  var myFuture = Future(() {
    print("aaa");
    Future.delayed(Duration(microseconds: 2000), () {
      print("delay");
    });
    return "Hello";
  });
  print("bbb");
  myFuture.then((_) => print("ccc"));
  print("ddd");
}
