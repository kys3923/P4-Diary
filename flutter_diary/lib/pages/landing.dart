import 'package:flutter/material.dart';


class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          color: Colors.grey[400],
          icon: Icon(Icons.search),
          tooltip: 'search your diary',
          onPressed: () {
            print('Search button clicked');
          },
        ),
      ),
    );
  }
}
