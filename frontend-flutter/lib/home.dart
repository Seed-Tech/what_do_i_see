import 'package:flutter/material.dart';
import 'model.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _member = true;

  singIn() {
    setState(() {
      if (_member == true){
        _member = false;
      }
      else
        _member = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
              Color.fromRGBO(20, 220, 192, 1.0),
              Color.fromRGBO(142, 135, 202, 1.0),
              Color.fromRGBO(206, 96, 207, 1.0)
              ],
            ),
          ),

          child: Padding(
            padding: EdgeInsets.all(40),
            child:Column(
              children: <Widget>[

                Icon(
                  Icons.account_circle,
                  size: 140.0,
                  color: Colors.white70
                ),

                SizedBox(height: 40,),

                _member == true ? 
                // log in 
                Text(
                  'MEMBER LOGIN',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ) :
                // sing in
                Text(
                    'NEW MEMBER',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                ),

                SizedBox(height: 25,),

                Container(
                  color: Colors.white24,
                  width: 250,
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top:10),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white54
                      ),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 25,),

                Container(
                  color: Colors.white24,
                  width: 250,
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top:10),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white54
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25,),

                _member == true ?
                // log in
                SizedBox(height: 0,)
                : Container(
                  color: Colors.white24,
                  width: 250,
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top:10),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white54
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                
                _member == true ?
                // log in
                SizedBox(height: 0,)
                : SizedBox(height: 25,),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          Model(),
                      ),
                    );
                  },
                  child: Container(
                    width: 250,
                    height: 40,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                    child: _member == true ? Text(
                      'Log In',
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 14),
                    ) :
                    Text(
                      'Sign In',
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 14),
                    ),
                  ),
                ),

                SizedBox(height: 25,),

                _member == true ?
                Text(
                  'Not a member?',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12
                  )
                ) :
                Text(
                  'Have an account?',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12
                  )
                ),

                SizedBox(height: 5,),

                GestureDetector(
                  onTap: singIn,
                  child: Container(
                    width: 120,
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                    child: _member == true ? Text(
                      'Sign In',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 12),
                    ) :
                    Text(
                      'Log In',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 12),
                    )
                  )
                ),
              ],
            ),
          ),   
        ),
      ),
    );
  }
}