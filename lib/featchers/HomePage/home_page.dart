import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Menu/menu_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  double _currentPage = 0.0;

  List<Widget> page = [
    ArticleScreen(
      image: 'https://www.aljazeera.com/wp-content/uploads/2024/08/AFP__20240805__36AR2PB__v3__Preview__BangladeshUnrestStudents-1722865448.jpg?resize=730%2C410&quality=80',
      title: 'Bangladesh protests updates: Sheikh Hasina quits, interim gov’t taking over',
      date: 'Uploaded: Aug 5, 2024',
      descriptionTitle: 'Prime Minister Sheikh Hasina resigns and flees Bangladesh after weeks of deadly unrest.'
        'Local media reports in India say an aircraft with Hasina on board lands at Hindon Airbase near New Delhi.'
        'Thousands of people storm Hasina’s official residence in Dhaka amid scenes of jubilation in the streets.'
        'The head of the army says an interim government will be formed and pledges justice for those who have been killed.',
    ),
    ArticleScreen(
      image: 'https://cdn.vox-cdn.com/thumbor/-m3nbupnxTC1JmKCDTgFF5Joy30=/0x716:2508x2029/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/25555376/usa_today_23876576.jpg',
      title: 'Pan Zhanles new swimming world-record at Olympics makes no sense, and thats the problem',
      date: 'By James Dator Aug 1,2024,11:30am',
      descriptionTitle: 'Pan Zhanle did the unthinkable on Wednesday in the men’s 100 meter freestyle. The 19-year-old'
        'didn’t just break the most difficult world record in swimming, but he smashed it by 0.4 seconds'
        'and beat second place by 1.08 seconds, a full body length. What has ensued from that moment is,'
        'in a word, ugly. There have been allegations of doping from one side, claims of racism from the'
        'other, and in the middle the inescapable reality that what ensued simply doesn’t make sense.',
    ),ArticleScreen(
      image: 'https://media.cnn.com/api/v1/images/stellar/prod/c-gettyimages-1240645382-20240721190627192.jpg?c=16x9&q=h_833,w_1480,c_fill',
      title: 'What to know about the 25th Amendment as Trump makes wild claim',
      date: 'Updated 7:01 PM,Wed July 24,2024',
      descriptionTitle: 'No matter what Biden says or how much his fellow Democrats try to build up his accomplishments as president, multiple Republicans have argued that the 25th'
        'Amendment to the Constitution should be used to remove Biden from office ASAP – something that’s not going to happen since no Democrat supports it.',
    )
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            // Swiping in the left direction (to the next page)
            Get.to(()=>const MenuPage(), transition: Transition.leftToRight);
          }
        },
        child: SingleChildScrollView(
          child: Stack(

            children: [
              SizedBox(
                height:750,
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _pageController,
                  itemCount: page.length, // Number of pages
                  itemBuilder: (context, index) {
                    // Calculate the difference between the current page and the index
                    final pageDifference = _currentPage - index;
                    final percentVisible = 1 - pageDifference.abs();

                    return Transform.translate(
                      // Move the page up or down depending on swipe direction
                      offset: Offset(0, pageDifference *100), // Adjust this value to control the vertical motion
                      child: Opacity(
                        opacity: percentVisible.clamp(0.0, 1.0),
                        child: Center(
                          child: page[index],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                bottom: 0,
                   left: 5,
                  right: 5,
                child: Card(
                  elevation: 8,
                        shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                         ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height:70,
                    child: Stack(
                      fit: StackFit.expand,  // Ensure the background image fills the container
                      children: [
                        // Background image with opacity
                        Opacity(
                          opacity: 0.2, // Set opacity from 0.0 (transparent) to 1.0 (fully visible)
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://s3-alpha-sig.figma.com/img/7e2f/c4f2/3585972af99d815369ee89eae46d78cb?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=exopGuqyS490Pp0YyA3VUi3sG1e1KT3dV68lFsVS0tKbpjTgU1jFPqDF7PwLH~VO1aAoLZYwjWWrrGmNF3sse1E6aEaP17Y4B6CfL~yVseH25YvopF5yyh1-aWUPvu2KapRRtfI3Ehp-jSZ1sSv5ljPKKUWfkxxuePm3~FnwLlFXpoWMKseOnHP4LFmNrrhZk5L~WEIzOpUeCzYk9JisSXEXuEjdct0tYNldKm1Vztid3NG3iZEn3VCWN7x~zbGkcBpCe8LbWim7CcSy190fcAyiOb5aBPIHDHkX-5QxiFkNLqB5RzQHYDrkumx4R0uyk89dKwd4fKJCI8veL-gMcg__',
                                  ),
                                  fit: BoxFit.fill,  // Make the image cover the entire container
                                ),
                              ),

                            ),
                          ),
                        ),

                        // Foreground content
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Paris Olympiad 2024",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
                                  Text('Related Newes',style: TextStyle(color: Colors.white,fontSize: 12,),),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}


class ArticleScreen extends StatelessWidget {
  String? image,title,date,descriptionTitle;

  ArticleScreen( {super.key, required this.image,required this.title,required this.date,required this.descriptionTitle,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main content scrollable area
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 16,
                    right: 16,
                    child: GestureDetector(
                      onTap: () {
                        // Handle related news tap
                      },
                      child:  Text(
                        title!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Top image (you can load this from the network)

              Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                 // color: Colors.yellow
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      //SizedBox(height: 8),
                      // Post info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            date!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 16),
                      // Article description
                      Text(
                        maxLines: 10,
                       descriptionTitle!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Source: Prothom Alo, July 23, 2024",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               // Space to ensure overlay doesn't hide text
            ],
          ),
          Positioned(
              left: 300,
              top: 340,
              child:
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Daily Topper",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              )
          ),
          // Bottom Navigation Bar
        ],
      ),
    );
  }
}

