import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue[100],
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Image.asset('assets/icon.png'),
                    )
                  ],
                )),
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
