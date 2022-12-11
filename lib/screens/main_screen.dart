import 'package:chat_app/config/palette.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  int animationMillisecond = 200;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword ='';


  void _tryValidation(){
    final isValid = _formKey.currentState!.validate();
    if(isValid){
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/red.jpg'),
                    fit: BoxFit.fill
                  )
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                            text: 'Welcome ',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white
                            ),
                            children: [
                              TextSpan(
                                text: isSignupScreen ? 'to My Chat' : 'back',
                                style: TextStyle(

                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]
                          )
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        isSignupScreen ? 'Signup to continue' : 'Signin to continue',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ),
            //배경
            AnimatedPositioned(
              duration: Duration(milliseconds: animationMillisecond),
              curve: Curves.fastOutSlowIn,
              top: 180,
              child: AnimatedContainer(
                duration: Duration(milliseconds: animationMillisecond),
                curve: Curves.fastOutSlowIn,
                padding: EdgeInsets.all(20.0),
                height: isSignupScreen ? 280.0 : 230.0,
                width: (MediaQuery.of(context).size.width < 500) ? MediaQuery.of(context).size.width-40 : 440,
                margin: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.width < 500) ? 20 : (MediaQuery.of(context).size.width-440)/2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 5
                    )
                  ]
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen ? Palette.activeColor : Palette.textColor1,
                                  ),
                                ),
                                if(!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Signup',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen ? Palette.activeColor : Palette.textColor1,
                                  ),
                                ),
                                if(isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      if(isSignupScreen)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: ValueKey(1),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 4){
                                    return 'Please enter at least 4 characters';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userName = value!;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                      Icons.account_circle,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Palette.textColor1,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0)
                                    )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Palette.textColor1
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),

                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                key: ValueKey(2),
                                validator: (value){
                                  if(value!.isEmpty || value.contains('@')){
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userEmail = value!;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  hintText: 'email',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),

                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                key: ValueKey(3),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 6){
                                    return 'Password must be at least 7 characters long.';
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  userPassword = value!;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  hintText: 'password',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),

                              )
                            ],
                          ),
                        ),
                      ),
                      if(!isSignupScreen)
                      Container(
                        key: _formKey,
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                key: ValueKey(4),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 4){
                                    return 'Please enter at least 4 characters';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),

                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                key: ValueKey(5),
                                validator: (value){
                                  if(value!.isEmpty || value.length < 6){
                                    return 'Password must be at least 7 characters long.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Palette.iconColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Palette.textColor1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  hintText: 'password',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                ),

                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //텍스트 폼 필드
            AnimatedPositioned(
              duration: Duration(milliseconds: animationMillisecond),
              curve: Curves.fastOutSlowIn,
              top: isSignupScreen ? 420 : 370,
              left: (MediaQuery.of(context).size.width-90)/2,
              child: Container(
                padding: EdgeInsets.all(15),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),

                ),
                child: GestureDetector(
                  onTap: (){
                    _tryValidation();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange,
                          Colors.red
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0,1)
                        )
                      ]
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ),
            //전송버튼
            AnimatedPositioned(
              duration: Duration(milliseconds: animationMillisecond),
              curve: Curves.fastOutSlowIn,
              top: MediaQuery.of(context).size.height-125,
              left: (MediaQuery.of(context).size.width-155)/2,
              child: Column(
                children: [
                  Text(isSignupScreen ? 'or Signup With' : 'or Signin With'),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.add),
                    label: Text('Google'),
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(155, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Palette.googleColor
                    ),
                  ),
                ],
              ),
            )
            //google

          ],
        ),
      ),
    );
  }
}



