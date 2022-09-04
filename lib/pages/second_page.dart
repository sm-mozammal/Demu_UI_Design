import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'first_page.dart';

class SecondPage extends StatefulWidget {
  static const String routeName = '/second';

  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final searchController = TextEditingController();
  @override

  int _selectedIndex = 0;
  int currentPos = 0;

  List<String> listPaths = [
    "images/img_1.png",
    "images/img_1.png",
    "images/img_1.png",
    "images/img_1.png",
    "images/img_1.png",
    "images/img_1.png",
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


  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: Text('kf'),
      // ),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xF5F5F5), Colors.white])),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      height: 20,
                      child:
                        IconButton(
                            onPressed: (){
                              Navigator.pushNamed(context, FirstPage.routeName);
                            }, icon: Icon(Icons.arrow_back,size: 25,),)
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(22.5),
                            child: Image.asset(
                              'images/img_2.png',
                              fit: BoxFit.cover,
                              height: 53,
                              width: 45,
                            )),
                        Container(
                          width: 223,
                          alignment: Alignment.center,
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.red)),
                                hintText: 'search with keywords',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(22.5),
                            child: Image.asset(
                              'images/img_3.png',
                              fit: BoxFit.cover,
                              height: 53,
                              width: 45,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Mentors for CSD',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CarouselSlider.builder(
                      itemCount: listPaths.length,
                      options: CarouselOptions(
                          height: 400,
                          viewportFraction: 0.8,
                          aspectRatio: 16 / 9,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              var currentPos = index;
                            });
                          }),
                      itemBuilder: (context, index, realIndex) {
                        return Stack(
                          children: [
                            MyImageView(listPaths[index]),
                            Positioned(
                              top: 200,
                              left: 20,
                              right: 0,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'John Doe',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,

                                        ),
                                        //textAlign: Alignment.,
                                      ),
                                      SizedBox(width: 10,),
                                      Image.asset(
                                        'images/img_9.png',
                                        height: 25,
                                        width: 25,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  const Text('Loreum | Loreum dollor | CSD',style: TextStyle(fontSize: 16,color: Colors.white),),
                                  SizedBox(height: 5,),
                                  const Text('Work at: Bangladesh Programming Ltd',style: TextStyle(fontSize: 11,color: Colors.white),),
                                  const Text('Studied from: Bangladesh University of Science',style: TextStyle(fontSize: 11,color: Colors.white),),
                                  const Text('From: Dhaka, Bangladesh',style: TextStyle(fontSize: 11,color: Colors.white),)
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Container(
                      height: 60,
                      width: 340,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.red, Colors.red]),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/img_4.png',
                            height: 20,
                            width: 25,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Lorum ipsum doller',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.dataset_outlined, size: 30,color: Colors.red),
          Icon(Icons.home, size: 45,color: Colors.red,),
          Icon(Icons.calendar_month_outlined, size: 30,color: Colors.red,),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }

}
