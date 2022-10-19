import 'package:flutter/material.dart';

class AboutDeveloper extends StatelessWidget {
  const AboutDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
        title: const Text("About Developer", style: TextStyle(color: Colors.black54),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const Center(child: Text("Sourav kumar", style: TextStyle(fontSize: 20, color: Color(0xFF7ab6d9),),)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Address: ", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                      Text("Nalua, Sakhipur, Tangail", style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Mobile No: ", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                      Text("+8801731592771", style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("E-mail: ", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                      Text("souravj@gmail.com", style: TextStyle(color: Colors.blue,),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Text("Objective of Career:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
                  const SizedBox(height: 5,),
                  const Text("As a computer engineer, I want to provide my acquired technical knowledge and skill efficiently at my profession as required by a company of farm that will help me for achieving the target and developing the best performance in the organization",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Computer Skills:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
                  const SizedBox(height: 5,),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.ac_unit, color: Colors.black54, size: 16,),
                            SizedBox(width: 5,),
                            Text("MS Office (word, power point, Excel, Access)", style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit, color: Colors.black54, size: 16,),
                            SizedBox(width: 5,),
                            Text("Graphics Design Expert (Adobe Photoshop, \nAdobe Illustrator", textAlign: TextAlign.justify, style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit, color: Colors.black54, size: 16,),
                            SizedBox(width: 5,),
                            Text("Web Design Basic (HTML5, CSS3)", textAlign: TextAlign.justify, style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit, color: Colors.black54, size: 16,),
                            SizedBox(width: 5,),
                            Text("Mobile App Development with Flutter and Dart \n(Android and IOS)", textAlign: TextAlign.justify, style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit, color: Colors.black54, size: 16,),
                            SizedBox(width: 5,),
                            Text("Android Native App Development with Java (Basic)", textAlign: TextAlign.justify, style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit, color: Colors.black54, size: 16,),
                            SizedBox(width: 5,),
                            Text("Computer Hardware and Maintains)", textAlign: TextAlign.justify, style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit, color: Colors.black54, size: 16,),
                            SizedBox(width: 5,),
                            Text("Windows Installation/ Troubleshooting)", textAlign: TextAlign.justify, style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit, color: Colors.black54, size: 16,),
                            SizedBox(width: 5,),
                            Text("Hardware and Software Installation)", textAlign: TextAlign.justify, style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.ac_unit, color: Colors.black54, size: 16,),
                            SizedBox(width: 5,),
                            Text("Internet Browsing)", textAlign: TextAlign.justify, style: TextStyle(color: Colors.black54),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Training Summaries:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
                  const SizedBox(height: 5,),
                  Table(
                    border: TableBorder.all(
                      color: Colors.black54,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    children: [
                      TableRow(
                        children: [
                          Column(
                            children:const [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text('Training Title', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Column(children:const [Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('Institute', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                          )]),
                          Column(children:const [Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('Country', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                          )]),
                          Column(children:const [Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('Location', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                          )]),
                          Column(children:const [Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('Year', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                          )]),
                          Column(children:const [Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('Duration', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                          )]),
                        ]
                      ),
                      TableRow(
                          children: [
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Mobile App Development with Flutter and Dart', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('People N Tech', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Bangladesh', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('151-7 Green road Dhaka 1205', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('2022', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('3 month', style: TextStyle(color: Colors.black54,)),
                            )]),
                          ]
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text("Educational Qualification:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
                  const SizedBox(height: 5,),
                  Table(
                    border: TableBorder.all(
                      color: Colors.black54,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                    children: [
                      TableRow(
                          children: [
                            Column(
                              children:const [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text('Name of Degree', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Name of Board', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Institute', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Passing Year', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Result', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                            )]),
                          ]
                      ),
                      TableRow(
                          children: [
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('SSC', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Dhaka', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Nalua Based Khan High School', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('2015', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('3.67', style: TextStyle(color: Colors.black54,)),
                            )]),
                          ]
                      ),
                      TableRow(
                          children: [
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Diploma In Computer Engineering', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('BTEB', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('Haji Abul Hossain Institute of Technology (HABHIT), Tangail', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('2021', style: TextStyle(color: Colors.black54,)),
                            )]),
                            Column(children:const [Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text('3.27', style: TextStyle(color: Colors.black54,)),
                            )]),
                          ]
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
