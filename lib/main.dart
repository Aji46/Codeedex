import 'package:codeedex/services/providers/auth_provider.dart';
import 'package:codeedex/services/providers/obscureicon.dart';
import 'package:codeedex/view/login/Login_Screen.dart';
import 'package:codeedex/view_Model/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
      create: (context) => AuthProvider(), ),
          ChangeNotifierProvider(create: (_) => TextFieldProvider()),
       ChangeNotifierProvider(create: (_) => HomeViewModel()..fetchProducts()),
      
      ],
      child: MaterialApp(
      
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
