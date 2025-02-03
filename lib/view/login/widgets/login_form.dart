import 'package:codeedex/Constants/color.dart';
import 'package:codeedex/services/providers/auth_provider.dart';
import 'package:codeedex/view/home_page/Home_page.dart';
import 'package:codeedex/view/login/widgets/input_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

void _login(BuildContext context) async {
  if (_formKey.currentState!.validate()) {
    String email = _emailController.text;
    String password = _passwordController.text;

    print("Email: $email");
    print("Password: $password");

    if (email == "prithew.codeedex@gmail.com" && password == "12345") {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      bool isSuccess = await authProvider.login(email, password);

      if (isSuccess) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login failed. Check your credentials.")),
        );
      }
    } else {
      // Display an error message if the credentials are incorrect
      print("+++++++++++++++++++++++++");
      print("Invalid login attempt");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email or password. Please check and try again.")),
      );
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Log-in',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          InputField(
            label: 'E-Mail',
            hintText: 'Enter mail id',
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) return "Email is required";
              return null;
            },
          ),
          const SizedBox(height: 20),
          InputField(
            label: 'Password',
            hintText: 'Enter password',
            isPassword: true,
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) return "Password is required";
              return null;
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forget Password?',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.buttoncolor,
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => _login(context),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:MyColors.mycolor1 ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
