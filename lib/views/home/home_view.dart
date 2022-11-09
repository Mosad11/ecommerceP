import 'package:ecommerce_p/views/home/cart_view.dart';
import 'package:ecommerce_p/views/home/explore_view.dart';
import 'package:ecommerce_p/views/home/profile_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentindex = 0;
  List<Widget> bodylist = [ExploreView(), CartView(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodylist[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}
