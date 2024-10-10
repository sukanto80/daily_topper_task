import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'featchers/HomePage/home_page.dart';


class MainManuScreen extends StatefulWidget {
  const MainManuScreen({super.key});

  @override
  State<MainManuScreen> createState() => _MainManuScreenState();
}

class _MainManuScreenState extends State<MainManuScreen> {
  final controller = Get.put(MainManuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Obx(
            ()=>
            NavigationBar(
              elevation: 0,
              height: 80,
              onDestinationSelected:(index)=>controller.selectedIndex.value=index,
              selectedIndex: controller.selectedIndex.value,
              destinations: const [
                 Icon(Icons.home),
                 Icon(Icons.list_alt_outlined),
                 Icon(Icons.notifications),
                 Icon(Icons.account_circle_rounded)
              ],
            ),
      ) ,
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class MainManuController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens =[const HomeScreen(),Container(color: Colors.indigo,),Container(color: Colors.red,),Container(color: Colors.green,)];
}
