import 'dart:convert';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slugify/slugify.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_screen.dart';

class UpdateScreen extends StatefulWidget {

  final String token;
  final int id;
  final String title;
  final String sub_title;
  final String description;

  const UpdateScreen({Key? key, required this.id, required this.title, required this.sub_title, required this.description, required this.token,}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState(id, title, sub_title, description, token);
}

class _UpdateScreenState extends State<UpdateScreen> {

  String token = "";
  int? _id;
  String title = "";
  String sub_title = "";
  String description = "";

  _UpdateScreenState(int _id, String title, String sub_title, String description, String token){
    this._id = _id;
    this.title = title;
    this.sub_title = sub_title;
    this.description = description;
    this.token = token;
  }

  TextEditingController _titleController = TextEditingController();
  TextEditingController _subTitleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _loading = false;

  updateBlog()async{
    Fluttertoast.showToast(msg: "Validation success");
    var slug = slugify(_titleController.text);
    int id = Random().nextInt(100);
    var url = Uri.https('apitest.hotelsetting.com', 'api/admin/blog-news/update/$_id');
    var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'title': _titleController.text,
          'sub_title': _subTitleController.text,
          'slug': slug,
          'description': _descriptionController.text,
          'category_id': id,
        })
    );
    print(_id);
    print(title);
    print(sub_title);
    print(description);
    Fluttertoast.showToast(msg: "Update success");
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(token: token,)));
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _titleController.text = title;
    _subTitleController.text = sub_title;
    _descriptionController.text = description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
        title: const Text("Update Blog", style: TextStyle(color: Colors.black54),),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15,),
              TextFormField(
                  controller: _titleController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter a title";
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(),
                    hintText: "Enter your blog title",
                  )
              ),
              const SizedBox(height: 10,),
              TextFormField(
                  controller: _subTitleController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter a sub title";
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Sub Title",
                    border: OutlineInputBorder(),
                    hintText: "Enter your blog sub title",
                  )
              ),
              const SizedBox(height: 10,),
              TextFormField(
                  controller: _descriptionController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter a description";
                    }
                  },
                  maxLines: 8,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(),
                    hintText: "Enter your blog description",
                  )
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _loading = true;
                  });
                  if(_formKey.currentState!.validate()){
                    return updateBlog();
                  }else{
                    setState(() {
                      _loading = false;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7ab6d9),
                ),
                child: const Text("Update", style: TextStyle(fontSize: 18),),
              ),
              Center(
                child: Visibility(
                  visible: _loading,
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
