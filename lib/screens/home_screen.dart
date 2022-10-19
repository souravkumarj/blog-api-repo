import 'package:blog/screens/about_developer_screen.dart';
import 'package:blog/screens/add_post_screen.dart';
import 'package:blog/screens/login_screen.dart';
import 'package:blog/screens/read_more_screen.dart';
import 'package:blog/screens/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {

  final String token;

  const HomeScreen({Key? key, required this.token}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState(token);
}

class _HomeScreenState extends State<HomeScreen> {

  String token = "";

  _HomeScreenState(String token){
    this.token = token;
  }

  List blogData = [];

  bool _loading = false;
  var _id;

  blogList() async{
   setState(() {
     _loading = true;
   });
    var url = Uri.https('apitest.hotelsetting.com', 'api/admin/blog-news');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    setState(() {
      blogData = jsonResponse['data']['blogs']['data'] as List;
      _loading = false;
    });
  }

  deleteBlog()async{
    var url = Uri.https('apitest.hotelsetting.com', 'api/admin/blog-news/delete/$_id');
    var response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  saveInfo()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("login");
    print(prefs.getString('login'));
  }

  logOut()async{
    var url = Uri.https('apitest.hotelsetting.com', 'api/logout');
    var response = await http.post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode == 200){
      Fluttertoast.showToast(msg: "Logout Success");
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
      setState(() {
        saveInfo();
      });
    }else{
      print("Error!");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      blogList();
    });
    super.initState();
  }

  showAlertDialog(BuildContext context){
    final AlertDialog _alertDialog = AlertDialog(
      title: const Text("Delete!", style: TextStyle(color: Colors.red),),
      content: const Text("Are you delete this blog?"),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text("No"),
        ),
        TextButton(
          onPressed: (){
            setState(() {
              deleteBlog();
              Navigator.pop(context);
              Fluttertoast.showToast(msg: "Delete success");
              initState();
            });
          },
          child: const Text("Yes"),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
        title: const Text("Blog", style: TextStyle(color: Colors.black54),),
        actions: [
          IconButton(
            onPressed: (){
              initState();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF7ab6d9),
              child: Text("Photo", style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 20,),
            const Text("admin@gmail.com", style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            const Divider(),
            const SizedBox(height: 30,),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> const AboutDeveloper()));
              },
              child: const Text("About Developer"),
            ),
            const SizedBox(height: 10,),
            // Spacer(),
            // Divider(),
            TextButton(
              onPressed: (){
                logOut();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.logout, color: Colors.black54,),
                  Text("Log out")
                ],
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : blogData.isEmpty ? const Center(child: Text("Sorry No Data Found")) : Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => AddPostScreen(token: token)));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7ab6d9),
              ),
              child: const SizedBox(
                width: 300,
                child: Center(child: Text("Create a new blog")),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: blogData.length,
                itemBuilder: (context, index){
                  final blog = blogData[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/post_img.jpg"),
                            const SizedBox(height: 10,),
                            Text(blog['title'], style: const TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 10,),
                            Text(blog['description']),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => ReadMoreScreen()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF7ab6d9)
                                  ),
                                  child: const Text("Read more"),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateScreen(id: blog['id'], title: blog['title'].toString(), sub_title: blog['sub_title'].toString(), description: blog['description'].toString(), token: token)));
                                  },
                                  icon: const Icon(Icons.edit, color: Color(0xFF7ab6d9),),
                                ),
                                const SizedBox(width: 5,),
                                IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _id = blog['id'];
                                    });
                                    showAlertDialog(context);
                                  },
                                  icon: const Icon(Icons.delete, color: Colors.red,),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
      ),
    );
  }
}
