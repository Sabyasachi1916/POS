import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos/modules/home/category/category_model.dart';
import 'package:pos/modules/home/category/category_services.dart';
import 'package:pos/modules/home/cuisine/cuisine_model.dart';
import 'package:pos/modules/home/cuisine/cuisine_service.dart';
import 'package:pos/modules/home/product/product_model.dart';
import 'package:pos/modules/home/product/product_service.dart';
import 'package:pos/modules/login/view/pinLogin.dart';
import 'package:pos/user_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(color: Color.fromRGBO(37, 41, 60, 1))),
      home: const PinLogin(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool isLoading;
   Future<List<CuisineListModel>>? cuisinelist;
   Future<List<CategoryModel>>? categorylist;
   Future<ProductModel>? productList ;
  CuisineListModel? selectedCuisine;

  getCuisineData() {
    cuisinelist =
        CuisineService().getCuisines();
    cuisinelist?.then((value) => {
          setState(() {
            isLoading = false;
            log('user token is ${value}');
          })
        });
  }
  //fetch all category data
  getCategoryData() { 
    categorylist =
        CategoryService().getCategorylist();
        categorylist?.then((value) => {
              setState(() {
                isLoading = false;
                log('Category List is ${value}');
              })
        });
  }

  late CuisineListModel cuisines;

  @override
  void initState() {
    log('init state called');
    getCuisineData();
    getCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            // const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   child: Text('Drawer Header'),
            // ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("POS"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.yellow, // foreground
            ),
            onPressed: () {},
            child: Text('Shift started on 12.12.22'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, // foreground
            ),
            onPressed: () {},
            child: Text('Hi ${UserInfo.shared.info.user.firstName}'),
          )
        ],
      ),
      body: Container(
        color: Color.fromRGBO(43, 47, 69, 1),
        child: Row(children: [
          Expanded(
            //Left part
            flex: 3,
            child: Container(
              //color: Colors.red,
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(0, 74, 152, 1),
                          ).copyWith(
                              elevation: ButtonStyleButton.allOrNull(0.0)),
                          onPressed: () => {},
                          child: const Text('Home'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(213, 45, 62, 1),
                          ).copyWith(
                              elevation: ButtonStyleButton.allOrNull(0.0)),
                          onPressed: () => {},
                          child: const Text('Clear Cart'),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          child: TextButton(
                              child: Column(
                                children: [
                                  Text(
                                    "Order type",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(95, 192, 190, 190)),
                                  ),
                                  Text(
                                    "Take Out",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.yellow),
                                  ),
                                ],
                              ),
                              onPressed: (() => {})),
                        )),
                  ]),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color.fromARGB(65, 68, 88, 1),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.person_add,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Add Person",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            //Right Part
            flex: 7,
            child: Container(
              color: Colors.green,
              child: Column(children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.only(top: 5),
                    height: 40,
                    // margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      // keyboardType: TextInputType.,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(fontSize: 17),
                        hintText: 'Search',
                        suffixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                ),
                cuisinelist != null ? Expanded(child: populateCuisineList()) : SizedBox(height: 60,),
                categorylist != null ? Expanded(flex: 9, 
                          child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                      populateCategories(),
                                      populateProducts()
                                    ],)
                ): SizedBox(width: 60,)
              ]),
            ),
          )
        ]),
      ),
    );
  }

  FutureBuilder<List<CuisineListModel>> populateCuisineList() {
    return FutureBuilder(
                      future: cuisinelist,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                               return Container(
                                // return TextButton(
                                //     onPressed: () => {
                                //           setState(() {
                                //             selectedCuisine =
                                //                 snapshot.data[index].name;
                                //             for (var element
                                //                 in snapshot.data) {
                                //               element.selected = false;
                                //             }
                                //             snapshot.data[index].selected =
                                //                 true;
                                //           }),
                                //         },
                                //     child:
                                   child: InkWell(
                                    
                                     child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(4)),
                                          child:  Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child:  Text(
                                        '${snapshot.data[index].name}',
                                        style: TextStyle(
                                            color:
                                                snapshot.data[index].selected ==
                                                        true
                                                    ? Colors.black
                                                    : Colors.black45,
                                            fontSize: 20),
                                      ))),
                                      SizedBox(width: 2,)
                                      ]),
                                      onTap: () {setState(() {
                                            // selectedCuisine =
                                            //     snapshot.data[index].name;
                                            for (var element
                                                in snapshot.data) {
                                              element.selected = false;
                                            }
                                            snapshot.data[index].selected =
                                                true;
                                            selectedCuisine = snapshot.data[index];
                                          });
                                          fetchNewCategories(snapshot.data[index].diskTypeId.toString());
                                          }
                                   ));
                              });
                        }
                      });
  }

  FutureBuilder<List<CategoryModel>> populateCategories() {
    return FutureBuilder(
                      future: categorylist,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              width: 200,
                              child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  scrollDirection: Axis.vertical,
                                  
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: (() =>{
                                        
                                        fetchProductdetails(id: snapshot.data[index].id, dishTypeID: selectedCuisine != null ? selectedCuisine!.diskTypeId.toString() : "" )
                                      }),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(4)),
                                            child:  Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Text(
                                                    textAlign: TextAlign.left,
                                                    '${snapshot.data[index].name}',
                                                    style: const TextStyle(
                                                      //backgroundColor: Color.fromRGBO(255, 0, 0, 1),
                                                        color: Colors.white,
                                                        fontSize: 18, ),
                                                  ),
                                            )
                                          ),
                                          SizedBox(height: 2,)
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          );
                        }
                      });
  }
  
  void fetchNewCategories(String cuisineTypeID) {
    
    categorylist =
        CategoryService().getNewCategoies(cuisineType: cuisineTypeID);
        categorylist?.then((value) => {
              setState(() {
                isLoading = false;
                log('Category List is ${value}');
              }),
              if(categorylist != null){
                fetchProductdetails(id: value.first.id, dishTypeID: cuisineTypeID)
              }
              
        });
  }
  
  fetchProductdetails({required String id, required String dishTypeID}) {
    print('get product details from id - ${id} \- ${dishTypeID}');
    productList = ProductService().getProductList(id: id, dishTypeID: dishTypeID);
     productList?.then((value) => {
              setState(() {
                isLoading = false;
                log('Category List is ${value}');
                
              }),
             
              
        });
        
  }
  
  Expanded populateProducts(){
   return Expanded(
     child: FutureBuilder(
        future: productList,
        builder: (context, snapshot) {
          
            return GridView.builder(
                itemCount: snapshot.data?.resultDto.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3
                ),
                itemBuilder: (context, index) {
                  return Card(
                        color: Colors.white,
                        child: Center(child: Text('${snapshot.data?.resultDto.products?[index].productName}')),
                      );
                }
            );
          
            
          }
        ),
   );
   
  }
}
