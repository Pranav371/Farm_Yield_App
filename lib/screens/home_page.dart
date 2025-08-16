import 'package:farm_yield/widgets/homeCard_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Farm Yield App'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Welcome back!", style: TextStyle(fontSize: 20)),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(120, 180, 120, 0.363),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(120, 180, 120, 0.363),
                      offset: Offset(2, 4),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(168, 212, 168, 0.361),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quick Stats'),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(child: HomecardWidget()),
                          SizedBox(width: 12.0), // smaller gap
                          Expanded(child: HomecardWidget()),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(child: HomecardWidget()),
                          SizedBox(width: 12.0), // smaller gap
                          Expanded(child: HomecardWidget()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              //Yields Section
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(168, 212, 168, 0.361),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Yields Section'),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                            onPressed: () {},
                            child: Text("+ Add Yield Entry"),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(120, 180, 120, 0.363),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double
                                    .infinity, // Makes the container take full width
                                child: Text(
                                  'Recent Entries of Yield',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ), // Optional: adjust font size or style
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              //Expenses Section
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(168, 212, 168, 0.361),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Expenses Section'),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                            ),
                            onPressed: () {},
                            child: Text("+ Add Expenses"),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(120, 180, 120, 0.363),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double
                                    .infinity, // Makes the container take full width
                                child: Text(
                                  'Recent Expenses',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ), // Optional: adjust font size or style
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            

            ],
          ),
        ),
      ),
    );
  }
}
