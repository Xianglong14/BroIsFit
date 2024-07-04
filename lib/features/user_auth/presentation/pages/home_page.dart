import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_webs/app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../app/filter/fitness/screens/home.dart';
import '../../../app/filter/fitness/screens/testing.dart';
import '../../../app/home/home_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var user = FirebaseAuth.instance.currentUser;

  final iconItems = const [
    Icon(Icons.home, size: 30),
    Icon(Icons.person, size: 30),
    Icon(Icons.add, size: 30),
    Icon(Icons.people, size: 30),
    Icon(Icons.search_outlined, size: 30),
  ];

  int index = 0;

  List Screens = [
    HomeBody(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.color2,
        bottomNavigationBar: CurvedNavigationBar(
          items: iconItems,
          backgroundColor: AppColor.color5,
          color: AppColor.color1,
          height: 70,
          index: index,
          animationDuration: Duration(milliseconds: 300),
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
        body: Screens[index]);
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  void _onIconPressed() {
    print('Icon button pressed');
  }

  List<String> _selectedFilters = [];
  String _searchQuery = "";
  List<String> _items = [
    "Swimming",
    "Badminton",
    "Fitness",
    "Basketball",
    "Yoga"
  ];

  List<String> _imagePaths = [
    'assets/images/swimming.png',
    'assets/images/badminton.png',
    'assets/images/fitness.png',
    'assets/images/basketball.png',
    'assets/images/yoga.png'
  ];

  void _pageNavigate(String page) {
    if (page == "Fitness") {
      Get.to(() => FitnessHome());
    } else if (page == "Swimming") {
      Get.to(() => HighlightedImage());
    } else {
      Get.reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('MMM dd, yyyy').format(date);
    List<String> filteredItems = _items.where((item) {
      if (_selectedFilters.isEmpty) {
        return true;
      }
      return _selectedFilters.any((filter) => item.contains(filter));
    }).where((item) {
      if (_searchQuery.isEmpty) {
        return true;
      }
      return item.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications),
                      iconSize: 35.0,
                      onPressed: _onIconPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.grey[700],
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                labelText: "Search",
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.color5,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Wrap(
                            spacing: 8.0,
                            children: _items.map((filter) {
                              return FilterChip(
                                backgroundColor: AppColor.color2,
                                labelStyle: TextStyle(
                                    color: AppColor.color5,
                                    fontWeight: FontWeight.w600),
                                label: Text(filter),
                                selected: _selectedFilters.contains(filter),
                                onSelected: (bool selected) {
                                  setState(() {
                                    if (selected) {
                                      _selectedFilters.add(filter);
                                    } else {
                                      _selectedFilters.remove(filter);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //crossAxisCount: 2,
                          crossAxisCount: 1,
                          //crossAxisSpacing: 10.0,
                          mainAxisSpacing: 3.0,
                          //childAspectRatio: 2 / 2.5,
                          childAspectRatio: 2,
                        ),
                        itemCount: filteredItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Card(
                              color: Colors.grey[100],
                              elevation: 0.0,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      _imagePaths[
                                          _items.indexOf(filteredItems[index])],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    bottom: 30,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          filteredItems[index],
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: AppColor.color5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Show More",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColor.color5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_right,
                                              color: AppColor.color5,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              print('${filteredItems[index]}');
                              // Get.to(() => GenderHomeScreen());
                              // Get.put(DetailCtrl());
                              _pageNavigate(filteredItems[index]);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Card(
                              //   color: Colors.grey[100],
                              //   elevation: 4.0,
                              //   child: Center(
                              //     child: ListTile(
                              //       title: Column(
                              //         children: [
                              //           Image.asset(
                              //               _imagePaths[index % _imagePaths.length],
                              //               fit: BoxFit.cover,
                              //               height: 150,
                              //               width: double.infinity),
                              //           Center(child: Text(filteredItems[index])),
                              //         ],
                              //       ),
                              //       onTap: () {
                              //         print('${filteredItems[index]}');
                              //         // Get.to(() => GenderHomeScreen());
                              //         // Get.put(DetailCtrl());
                              //         _pageNavigate(filteredItems[index]);
                              //       },
                              //     ),
                              //   ),
                              // );

// Text(user!.uid.toString()),
            // Text(user!.metadata.lastSignInTime.toString()),
            // const SizedBox(height: 30),
            // GestureDetector(
            //   onTap: () {
            //     FirebaseAuth.instance.signOut();
            //     Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(builder: (context) => MyLoginPage()),
            //         (route) => false);
            //     showSuccessToast("Successfully signed out");
            //   },
            //   child: Container(
            //     width: 100,
            //     height: 45,
            //     decoration: BoxDecoration(
            //       color: Colors.blue,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: const Center(
            //       child: Text(
            //         "Sign Out",
            //         style: TextStyle(
            //             color: Colors.white, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ),
            // ),


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FilterChipSearchExample(),
//     );
//   }
// }

// class FilterChipSearchExample extends StatefulWidget {
//   @override
//   _FilterChipSearchExampleState createState() =>
//       _FilterChipSearchExampleState();
// }

// class _FilterChipSearchExampleState extends State<FilterChipSearchExample> {
//   List<String> _filters = ["Category 1", "Category 2", "Category 3"];
//   List<String> _selectedFilters = [];
//   String _searchQuery = "";

//   List<String> _items = [
//     "Item 1 - Category 1",
//     "Item 2 - Category 2",
//     "Item 3 - Category 3",
//     "Item 4 - Category 1",
//     "Item 5 - Category 2"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Filter Chips with Search"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Wrap(
//               spacing: 8.0,
//               children: _filters.map((filter) {
//                 return FilterChip(
//                   label: Text(filter),
//                   selected: _selectedFilters.contains(filter),
//                   onSelected: (bool selected) {
//                     setState(() {
//                       if (selected) {
//                         _selectedFilters.add(filter);
//                       } else {
//                         _selectedFilters.remove(filter);
//                       }
//                     });
//                   },
//                 );
//               }).toList(),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: "Search",
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (query) {
//                 setState(() {
//                   _searchQuery = query.trim(); // Trim the query
//                 });
//               },
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: _items.where((item) {
//                 if (_selectedFilters.isEmpty) {
//                   return true;
//                 }
//                 return _selectedFilters.any((filter) => item.contains(filter));
//               }).where((item) {
//                 if (_searchQuery.isEmpty) {
//                   return true;
//                 }
//                 return item.toLowerCase().contains(_searchQuery.toLowerCase());
//               }).map((item) {
//                 return ListTile(
//                   title: Text(item),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
