import 'package:flutter/material.dart';
import 'package:meal_mon/ui/authn/forgot_password_page.dart';
import 'package:meal_mon/ui/authn/signup_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sz=MediaQuery.of(context).size;
    const btnSyl= TextStyle(fontSize: 17,color: Colors.white);
    final inputBorder = OutlineInputBorder(borderSide: Divider.createBorderSide(context),);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBar(title: const Text("MEAL MON"),centerTitle: true,backgroundColor: Theme.of(context).primaryColor),
      body: Padding(
        padding: EdgeInsets.all(sz.width*0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: sz.width*0.7,
                child: Image.asset("assets/logo.png"),
            ),
            Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          filled: true,
                          contentPadding: const EdgeInsets.all(8),
                          labelText: "Email",
                          hintText: "usn@sit.ac.in",
                          prefixIcon: const Icon(Icons.email),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !RegExp(r'^1(SI|si)[0-9]{2}[A-Za-z]{2}[0-9]{3}@sit.ac.in$').hasMatch(value!)) {
                            return "Enter valid SIT-mail id";
                          } else {
                            return null;
                          }
                        }
                        ),
                    SizedBox(height: sz.height*0.015),
                    TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          filled: true,
                          contentPadding: const EdgeInsets.all(8),
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(icon: hidePassword? const Icon(Icons.visibility_off): const Icon(Icons.visibility),
                            onPressed: () => setState(() => hidePassword = !hidePassword,),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: hidePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(height: sz.height*0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: sz.width*0.35,
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Center(child: Text("Sign In",style: btnSyl,)),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          onTap: (){},
                        ),
                        GestureDetector(
                          child: Container(
                            width: sz.width*0.35,
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Center(child: Text("Sign Up",style: btnSyl,)),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SignUp())),
                        ),
                      ],
                    ),
                    SizedBox(height: sz.height*0.015),
                    GestureDetector(
                      child: Container(
                        width: sz.width*0.75,
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        child: Center(child: Text("Forgot Password",style: btnSyl,)),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPassword())),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
