import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Categories/categories_page.dart';
import '../HomePage/home_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();
  double _currentPage = 0.0;
  ScrollController _scrollController = ScrollController();
  List<Category> categories = [
    Category(name: 'National', imagePath: 'assets/images/national.jpg'),
    Category(name: 'International', imagePath: 'assets/images/international.jpg'),
    Category(name: 'Sports', imagePath: 'assets/images/sports.png'),
    Category(name: 'Finance', imagePath: 'assets/images/finance.jpg'),
    Category(name: 'Politics', imagePath: 'assets/images/politics.jpg'),
    Category(name: 'Entertainment', imagePath: 'assets/images/entertainment.jpg'),

    // Add more categories as needed
  ];
  bool hasTapped = false; // To track if an item has been tapped
  void _onHorizontalDrag(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      // Swipe Left - next category
      setState(() {
        _currentIndex = (_currentIndex + 1) % categories.length;
      });
    } else if (details.primaryVelocity! > 0) {
      // Swipe Right - previous category
      setState(() {
        _currentIndex = (_currentIndex - 1 + categories.length) % categories.length;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    // Scroll to the middle of the list on start

  }

  void _scrollToIndex(int index) {
    // Scroll to the specified index with animation
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / 3; // Adjust as per your design
    double targetOffset = itemWidth * index - screenWidth /2.2+ itemWidth / 2;

    _scrollController.animateTo(
      targetOffset,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(top:50),
              child: Center(
                child: SizedBox(
                  height: 50,
                  child: Image.asset('assets/images/daly_topper.png'),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                    Icon(Icons.trending_up,color: Colors.black54,size: 20,),
                    SizedBox(width: 8,),
                    Text('Trending',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),)
                  ],),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.black54,size: 20,),
                      SizedBox(width: 8,),
                      Text('Top 10 Today',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),)
                    ],),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.bookmark,color: Colors.black54,size: 20,),
                      SizedBox(width: 8,),
                      Text('Archived News',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),)
                    ],),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.edit,color: Colors.black54,size: 20,),
                      SizedBox(width: 8,),
                      Text('Marked News',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),)
                    ],),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            const SizedBox(height: 40,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Categories',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
                InkWell(
                  onTap: (){
                    Get.to(()=>CategoriesScreen());
                  },
                  child: Row(children: [
                    Text('view all',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black54)),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_forward_ios_rounded,size: 15),
                  ],),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              height: 100,
              child: ListView.builder(
                  controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                  itemBuilder: (context,index){

                    double leftPadding = index == 0
                        ? screenWidth / 2 - 80 // Start from middle
                        : 5; // Normal padding after tap
                    return  GestureDetector(
                      onTap: (){
                        setState(() {
                          // Item has been tapped, now scroll normally
                          _currentIndex=index;
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                          );

                          _scrollToIndex(index);
                        });
                      },
                     // onHorizontalDragEnd: _onHorizontalDrag,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          // Set width for each category item
                          margin: EdgeInsets.only(
                            left: leftPadding,
                            right: categories.length-1== index? screenWidth / 2 - 80 :0,// Ensure the first item starts from the middle
                          ),
                          child: Column(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),  // Adjust the radius as needed
                                child: Image.asset(
                              categories[index].imagePath,
                              fit: BoxFit.cover,
                                  color: _currentIndex==index? Colors.white.withOpacity(1.0):Colors.white.withOpacity(0.5),
                                  colorBlendMode: BlendMode.modulate,
                              width: _currentIndex==index?80:60,  // Set image width
                              height:  _currentIndex==index?80:60, // Set image height
                            )
                            ),
                            Text(categories[index].name,style: TextStyle(fontSize: 12),),

                          ],),
                        ),
                      ),
                    );
                  }
              )
            ),

            Container(
              height:screenheight/3.4 ,
            //  color: Colors.yellow,
              child: PageView.builder(
                onPageChanged: (index){
                  setState(() {
                    _currentIndex=index;
                    _scrollToIndex(index);
                  });

                  print(_currentIndex);
                },

                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: categories.length,
                  itemBuilder: (context,index){
                    return ListView.builder(
                      itemCount: 8,
                        itemBuilder: (context,index){

                        return Column(
                          children: [
                            Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                      width: 70,
                                      child: Image.asset('assets/images/dumi_image.jpg',fit: BoxFit.cover,)),
                                  SizedBox(width: 10,),
                                  Expanded(child: Text('কোটা সংস্কারের দাবিতে বঙ্গভবনে স্মারকলিপি দিলেন শিক্ষার্থীরা')),
                                ],
                              ),
                            SizedBox(height: 5,),
                            Divider(thickness: 1,color: Colors.grey,),
                          ],
                        );
                        }
                    );

                  }
              ),
            )

          ],
        ),
      )
    );
  }
}

class Category {
  final String name;
  final String imagePath;

  Category({required this.name, required this.imagePath});
}
