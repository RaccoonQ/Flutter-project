import 'package:flutter/material.dart';
import 'package:yao_app/screens/account/accountPage.dart';
import 'package:yao_app/screens/explore/explorePage.dart';
import 'package:yao_app/screens/products/productPage.dart';

import '../components/sizeConfig.dart';
import 'homePage.dart';

/// this page defines the basic bottom navigation bar layout of home screen
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> screenList = List();

  @override
  void initState() {
    super.initState();
    screenList
      ..add(HomePage())
      ..add(ExplorePage())
      ..add(ProductPage(title: 'Products'))
      ..add(AccountPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack is used to show child from list of provided childs
      // it can help keep the state of all childs
      body: IndexedStack(
        index: _currentIndex,
        children: screenList,
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 22 * SizeConfig.hRatio,
            selectedItemColor: Color(0xff011A70),
            unselectedItemColor: Color(0xff011A70),
            selectedLabelStyle: TextStyle(
              fontFamily: 'SfProText',
              fontSize: 10 * SizeConfig.tRatio,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'SfProText',
              fontSize: 10 * SizeConfig.tRatio,
              fontWeight: FontWeight.w500,
            ),
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/home.png')),
                title: new Text('Home'),
                activeIcon:
                    ImageIcon(AssetImage('assets/icons/home_active.png')),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/explore.png')),
                activeIcon:
                    ImageIcon(AssetImage('assets/icons/explore_active.png')),
                title: Text('Explore'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/product.png')),
                activeIcon:
                    ImageIcon(AssetImage('assets/icons/product_active.png')),
                title: Text('Product'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/account.png')),
                activeIcon:
                    ImageIcon(AssetImage('assets/icons/account_active.png')),
                title: new Text('Account'),
              )
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            }),
      ),
    );
  }
}
