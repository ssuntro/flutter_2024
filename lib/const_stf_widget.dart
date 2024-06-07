import 'package:flutter/cupertino.dart';

class ConstSTFWidget extends StatefulWidget {
  const ConstSTFWidget({super.key});

  @override
  State<ConstSTFWidget> createState() => _ConstSTFWidgetState();
}

class _ConstSTFWidgetState extends State<ConstSTFWidget> {
  @override
  Widget build(BuildContext context) {
    print("_ConstSTFWidgetState build");
    return Text("AA");
  }
}
