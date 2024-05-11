import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_page.dart';
import 'package:flutter_application_1/food_detail.dart';
import 'package:flutter_application_1/models/list_food.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_application_1/profile.dart';

class HomeScreen extends StatelessWidget {
  

  final TextEditingController _searchController = TextEditingController();
  List<ListFood> filteredFoodList = List.from(foodList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Image.asset("assets/images/girl.png"),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffFEE227),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartPage()),
                        );
                      },
                      icon: Image.asset(
                        "assets/images/shopbag.png",
                        width: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Xyraa!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "What flavour do you want today?",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Search"),
                              content: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: "Enter food name",
                                ),
                                onChanged: (value) {
                                  filteredFoodList = foodList
                                      .where((food) => food.nama
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                      .toList();
                                },
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _searchController.clear();
                                  },
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Search'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Image.asset(
                        "assets/images/filter.png",
                        width: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                margin: EdgeInsets.only(bottom: 10),
                height: 315,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredFoodList.length,
                  itemBuilder: (context, index) {
                    final ListFood food = filteredFoodList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailFood(food: food);
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 15, left: 0),
                        width: 225,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color(0xffFEE227),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  food.image,
                                  width: 150,
                                  height: 130,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food.nama,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      food.flav,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "\Rp. " + food.price.toString(),
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New in",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xffFF5F99),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    final ListFood food = foodList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 13),
                              decoration: BoxDecoration(
                                color: Color(0xffFEE227),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                  child: Image.asset(foodList[index].image)),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      foodList[index].nama,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "\Rp. " + foodList[index].price.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        FavB(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavB extends StatefulWidget {
  const FavB({Key? key}) : super(key: key);

  @override
  State<FavB> createState() => _FavBState();
}

class _FavBState extends State<FavB> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFav = !isFav;
          
        });
      },
      icon: Icon(
        isFav ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
        color: Color(0xffFF5F99),
        size: 24.0,
      ),
    );
  }
}
