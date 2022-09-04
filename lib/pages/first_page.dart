import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ui_design/pages/second_page.dart';

class FirstPage extends StatefulWidget {
  static const String routeName = '/first_page';

  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;
  int currentPos = 0;
  List<String> listPaths = [
    "images/slider.png",
    "images/slider.png",
    "images/slider.png",
    "images/slider.png",
    "images/slider.png",
    "images/slider.png",
  ];
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Wallet',
      style: optionStyle,
    ),
    Text(
      'Index 2: Special',
      style: optionStyle,
    ),
    Text(
      'Index 3: Menu',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffffecb3),
                Colors.white,
              ],
            )),
            child: Padding(
              padding:  const EdgeInsets.all(16.0),
              child: Center(
                  child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            Image.asset('images/logo.png'),
                            const SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Image.asset('images/logo-text.png'),
                            ),
                          ],
                        ),
                        Container(
                          height: 28,
                          width: 68,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.amber, Colors.red, Colors.red]),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, SecondPage.routeName);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: listPaths.length,
                          options: CarouselOptions(
                              viewportFraction: 1,
                              aspectRatio: 16/9,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentPos = index;
                                });
                              }
                          ),
                          itemBuilder: (context, index, realIndex) {
                            return MyImageView(listPaths[index]);
                          },
                        ),
                        Positioned(
                          bottom: 35,
                          left: 50,
                          right: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: listPaths.map((url) {
                              int index = listPaths.indexOf(url);
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentPos == index
                                      ? const Color(0xFFFAFAFA)
                                      : const Color.fromRGBO(38, 38, 38, 0.4),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(clipBehavior: Clip.none,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 152,
                              width: 154,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Image.asset('images/placeholder.png',fit: BoxFit.cover,
                                ),
                            ),
                            Positioned(
                              top: 55,
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('KFC',style: TextStyle(color: Colors.grey),),
                                  Text('Buy 1 Get 2', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -18,
                              left: 45,
                              right: 45,
                              child: Card(
                                elevation: 5,
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                  alignment: Alignment.center,
                                  width: 56,
                                  height: 56,
                                  child: Image.asset('images/food.png',fit: BoxFit.cover,
                                ),
                              ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 20,
                              left: 20,
                              child: TextButton(
                                  onPressed: () {
                                    //
                                  },
                                  child: Image.asset('images/search.png',fit: BoxFit.cover,),),
                            )
                          ],
                        ),
                        Stack(clipBehavior: Clip.none,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 152,
                              width: 154,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Image.asset('images/placeholder.png',fit: BoxFit.cover,
                                ),
                            ),
                            Positioned(
                              top: 55,
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('KFC',style: TextStyle(color: Colors.grey),),
                                  Text('Buy 1 Get 2', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -18,
                              left: 45,
                              right: 45,
                              child: Card(
                                elevation: 5,
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                  alignment: Alignment.center,
                                  width: 56,
                                  height: 56,
                                  child: Image.asset('images/food.png',fit: BoxFit.cover,
                                ),
                              ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 20,
                              left: 20,
                              child: TextButton(
                                  onPressed: () {
                                    //
                                  },
                                  child: Image.asset('images/search.png',fit: BoxFit.cover,),),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(clipBehavior: Clip.none,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 152,
                              width: 154,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Image.asset('images/placeholder.png',fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('KFC',style: TextStyle(color: Colors.grey),),
                                  Text('Buy 1 Get 2', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -18,
                              left: 45,
                              right: 45,
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  alignment: Alignment.center,
                                  width: 56,
                                  height: 56,
                                  child: Image.asset('images/food.png',fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 20,
                              left: 20,
                              child: TextButton(
                                onPressed: () {
                                  //
                                },
                                child: Image.asset('images/search.png',fit: BoxFit.cover,),),
                            )
                          ],
                        ),
                        Stack(clipBehavior: Clip.none,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 152,
                              width: 154,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Image.asset('images/placeholder.png',fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('KFC',style: TextStyle(color: Colors.grey),),
                                  Text('Buy 1 Get 2', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -18,
                              left: 45,
                              right: 45,
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  alignment: Alignment.center,
                                  width: 56,
                                  height: 56,
                                  child: Image.asset('images/food.png',fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 20,
                              left: 20,
                              child: TextButton(
                                onPressed: () {
                                  //
                                },
                                child: Image.asset('images/search.png',fit: BoxFit.cover,),),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    InkWell(
                      onTap: () {
                        //
                      },
                        child: Image.asset(
                      'images/banner.png',
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    )),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(clipBehavior: Clip.none,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 152,
                              width: 154,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Image.asset('images/placeholder.png',fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('KFC',style: TextStyle(color: Colors.grey),),
                                  Text('Buy 1 Get 2', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -18,
                              left: 45,
                              right: 45,
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  alignment: Alignment.center,
                                  width: 56,
                                  height: 56,
                                  child: Image.asset('images/food.png',fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 20,
                              left: 20,
                              child: TextButton(
                                onPressed: () {
                                  //
                                },
                                child: Image.asset('images/search.png',fit: BoxFit.cover,),),
                            )
                          ],
                        ),
                        Stack(clipBehavior: Clip.none,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 152,
                              width: 154,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Image.asset('images/placeholder.png',fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('KFC',style: TextStyle(color: Colors.grey),),
                                  Text('Buy 1 Get 2', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -18,
                              left: 45,
                              right: 45,
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  alignment: Alignment.center,
                                  width: 56,
                                  height: 56,
                                  child: Image.asset('images/food.png',fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 20,
                              left: 20,
                              child: TextButton(
                                onPressed: () {
                                  //
                                },
                                child: Image.asset('images/search.png',fit: BoxFit.cover,),),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(clipBehavior: Clip.none,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 152,
                              width: 154,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Image.asset('images/placeholder.png',fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('KFC',style: TextStyle(color: Colors.grey),),
                                  Text('Buy 1 Get 2', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -18,
                              left: 45,
                              right: 45,
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  alignment: Alignment.center,
                                  width: 56,
                                  height: 56,
                                  child: Image.asset('images/food.png',fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 20,
                              left: 20,
                              child: TextButton(
                                onPressed: () {
                                  //
                                },
                                child: Image.asset('images/search.png',fit: BoxFit.cover,),),
                            )
                          ],
                        ),
                        Stack(clipBehavior: Clip.none,
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              height: 152,
                              width: 154,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Image.asset('images/placeholder.png',fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 55,
                              left: 0,
                              right: 0,
                              bottom: 20,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('KFC',style: TextStyle(color: Colors.grey),),
                                  Text('Buy 1 Get 2', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Positioned(
                              top: -18,
                              left: 45,
                              right: 45,
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  alignment: Alignment.center,
                                  width: 56,
                                  height: 56,
                                  child: Image.asset('images/food.png',fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 20,
                              left: 20,
                              child: TextButton(
                                onPressed: () {
                                  //
                                },
                                child: Image.asset('images/search.png',fit: BoxFit.cover,),),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard),
            label: 'Wallet',
            backgroundColor: Colors.white54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_special_outlined),
            label: 'Special',
            backgroundColor: Colors.white54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
            backgroundColor: Colors.white54,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }

}

class MyImageView extends StatelessWidget{
  String imgPath;
  MyImageView(this.imgPath);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(imgPath)
    );
  }

}
