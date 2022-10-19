import 'package:blog/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _token = "";

  bool _loading = false;
  bool _btnActive = true;

  final formKey = GlobalKey<FormState>();


  SignIn() async{
    var url = Uri.https('apitest.hotelsetting.com', 'api/login');
    var response = await http.post(url, body: {'email': _emailController.text, 'password': _passwordController.text});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonResponse['data']['user']['name']);
    print(jsonResponse['data']['token']);
    print(jsonResponse['status']);
    if(response.statusCode == 200){
      Fluttertoast.showToast(msg: "Login Success");
      setState(() {
        _token = jsonResponse['data']['token'];
      });
      saveInfo();
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(token: _token)));
      setState(() {
        _loading = false;
      });
    }else{
      print("Error!");
    }
  }

  saveInfo()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("login", "save");
    print(prefs.getString('login'));
  }

  // checkLogin()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if(prefs.getString('login') == "save"){
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(token: _token,)));
  //   }
  // }

  @override
  void initState(){
    // TODO: implement initState
    //checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54),),
              const SizedBox(height: 5,),
              const Text("Please sign in to continue", style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 50,),
              TextFormField(
                controller: _emailController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter your email";
                  }
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  labelText: "E-mail",
                  border: OutlineInputBorder(),
                  hintText: "Enter your E-mail",
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter your password";
                  }
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  hintText: "Enter your password",
                ),
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: (){
                      debugPrint("Sign in button clicked");
                      setState(() {
                        _loading = true;
                      });
                      if(formKey.currentState!.validate()){
                        return SignIn();
                      }else{
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _loading? Colors.grey : Color(0xFF7ab6d9),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: const [
                          Text("Login", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward, size: 20, color: Colors.white,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: Visibility(
                  visible: _loading,
                  child: const CircularProgressIndicator(),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(color: Colors.grey),),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      debugPrint("sign up clicked");
                      Fluttertoast.showToast(msg: "Sign up clicked");
                    },
                    child: const Text("Sign up", style: TextStyle(color: Color(0xFF7ab6d9),),),
                  )
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
