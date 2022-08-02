import 'package:flutter/material.dart';
import 'package:login/provider/page_notifier.dart';
import 'package:provider/provider.dart';

class AuthPage extends Page{

  static final pageName = 'AuthPage';
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(settings:this, builder: (context)=>AuthWidget());
  }

}

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cPasswordController = TextEditingController();

  bool isRegister = true;

  Duration _duration = Duration(milliseconds: 300);
  Curve _curve = Curves.fastOutSlowIn;

  static final double _cornerRadius = 8.0;
  OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_cornerRadius),
      borderSide: BorderSide(color: Colors.transparent, width:0)
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/image.gif')
          )
        ), child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Form(
            key:_formKey,
            child: ListView(
              reverse: true,
              padding: EdgeInsets.all(16),
              children: [
                SizedBox(
                  height: 16,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 36,
                  child: Image.asset('assets/logo.jpg'),
                ),
                SizedBox(height: 16,),
                ButtonBar(
                  children: [
                    FlatButton(
                        child: Text('Login',
                            style: TextStyle(fontSize: 18,
                            fontWeight: isRegister?FontWeight.w400 : FontWeight.w600,
                            color: isRegister?Colors.black45 : Colors.black87),),
                        onPressed: (){
                          setState(() {
                            isRegister = false;
                          });
                        }),
                    FlatButton(
                        child: Text('Register',style: TextStyle(fontSize: 18,
                            fontWeight: isRegister?FontWeight.w600 : FontWeight.w400,
                            color: isRegister?Colors.black87 : Colors.black45),),
                        onPressed: (){
                          setState(() {
                            isRegister = true;
                          });
                        }),
                  ],
                ),
                SizedBox(height: 16,),
                _buildTextFormField("Email Adress", _emailController),
                SizedBox(height: 16,),
                _buildTextFormField("Password", _passwordController),
                SizedBox(height: 16,),
                AnimatedContainer(
                    height: isRegister ? 60 : 0,
                    duration: _duration,
                    curve: _curve,
                    child: _buildTextFormField("Confirm Password", _cPasswordController)),
                AnimatedContainer(height: isRegister?16:0,duration: _duration,
                  curve: _curve,),
                FlatButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      print("확인");
                      Provider.of<PageNotifier>(context,listen: false).goToMain();
                    }
                  },
                  color: Colors.black26,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_cornerRadius)
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(isRegister?"Register":"Login"),),
                Divider(
                  height:33,
                  thickness: 1,
                  color: Colors.black54,
                  indent: 0,
                  endIndent: 0,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton('assets/icon-google.png', (){
                      Provider.of<PageNotifier>(context,listen: false).goToMain();
                    }),
                    _buildSocialButton('assets/icon-facebook.png', (){
                      Provider.of<PageNotifier>(context,listen: false).goToMain();
                    }),
                    _buildSocialButton('assets/icon-apple.png', (){
                      Provider.of<PageNotifier>(context,listen: false).goToMain();
                    }),

                  ],
                )

              ].reversed.toList()
            ),
          ),
        ),
      ),
      ),
    );
  }

  Container _buildSocialButton(String imagePath, Function onPressed) {
    return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black12
                    ),
                    child: IconButton(
                      color: null,
                        onPressed: (){},
                        icon: ImageIcon(AssetImage(imagePath),color: null,)),
                  );
  }

  TextFormField _buildTextFormField(String labelText, TextEditingController controller) {
    return TextFormField(
                cursorColor: Colors.white,
                controller: controller,
                validator: (text){
                  if(controller != _cPasswordController && (text == null || text.isEmpty)){
                    return "입력창이 비어있어요!";
                  }
                  if(controller == _cPasswordController && isRegister && (text == null || text.isEmpty) && (_cPasswordController != _passwordController)){
                    return "비밀번호확인 칸을 확인하세요.";
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                 labelText: labelText,
                    filled: true,
                    fillColor: Colors.black54,
                    border: _border,
                  errorBorder: _border.copyWith(borderSide: BorderSide(color: Colors.black, width:3)),
                  enabledBorder:  _border,
                  focusedBorder: _border,
                  errorStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  labelStyle: TextStyle(color: Colors.white)
                ),
              );
  }
}
