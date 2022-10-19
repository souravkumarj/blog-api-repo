import 'package:flutter/material.dart';

class ReadMoreScreen extends StatefulWidget {
  const ReadMoreScreen({Key? key}) : super(key: key);

  @override
  State<ReadMoreScreen> createState() => _ReadMoreScreenState();
}

class _ReadMoreScreenState extends State<ReadMoreScreen> {
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
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Card(
          child: Container(
            padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 15),
            child: ListView(
              children: [
                Image.asset("assets/images/post_img.jpg"),
                const SizedBox(height: 10,),
                Text("blog['title']", style: const TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text("Sub title", style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text("blog['description']", style: TextStyle(color: Colors.black54),),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      onPressed: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateScreen(id: blog['id'], title: blog['title'].toString(), sub_title: blog['sub_title'].toString(), description: blog['description'].toString(),)));
                      },
                      icon: const Icon(Icons.edit, color: Color(0xFF7ab6d9),),
                    ),
                    const SizedBox(width: 5,),
                    IconButton(
                      onPressed: (){
                        setState(() {
                          //_id = blog['id'];
                        });
                        //showAlertDialog(context);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red,),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
