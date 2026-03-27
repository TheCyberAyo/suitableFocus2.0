import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/app_colors.dart';
import 'providers/cart_provider.dart';
import 'screens/initial_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CompanyApp());
}

class CompanyApp extends StatelessWidget {
  const CompanyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        title: 'Suitable Focus',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
        home: const InitialScreen(),
      ),
    );
  }
}
