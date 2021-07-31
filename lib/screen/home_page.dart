import 'package:flutter/material.dart';
import 'package:pratibha/body_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey.shade700,
        ),
        title: Image.asset(
          'assets/images/final.png',
          scale: 3.0,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
      body: BodyWidget(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.upcoming), label: 'Exams'),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: 'Payment'),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                    )),
                label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.laptop), label: 'Result'),
            BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
          ]),
    );
  }
}
