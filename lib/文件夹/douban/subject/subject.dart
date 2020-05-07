import 'package:flutter/material.dart';

main() {
  runApp(FXSubjectPage());
}

class FXSubjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title:Text("影视")
        ),
      ),
    );
  }
}
