import 'package:flutter/material.dart';
import 'package:meal_mon/ui/admin/home_page.dart';
import 'package:meal_mon/ui/authn/landing_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final inputBorder = OutlineInputBorder(borderSide: Divider.createBorderSide(context),);
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBar(title: Text("MEAL MOM: Sign Up"),centerTitle: true,backgroundColor: Theme.of(context).primaryColor,),
      body: Padding(
        padding: EdgeInsets.all(size.width*0.1),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(child: Image.asset("assets/logo.png"),width: size.width*0.7,),
            SizedBox(height: size.height*0.01,),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(height: size.height*0.015),
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
                  SizedBox(height: size.height*0.015),
                  TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: inputBorder,
                        focusedBorder: inputBorder,
                        enabledBorder: inputBorder,
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                        labelText: "Confirm Password",
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
                  SizedBox(height: size.height*0.02,),
                  GestureDetector(
                    onTap: (){
                      // final valid = formKey.currentState!.validate();
                      // if(valid){
                      //   signUp();
                      // }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(child: Text("SignUp",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account. "),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LandingPage())),
                        child: const Text("SignIn",style: TextStyle(fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
