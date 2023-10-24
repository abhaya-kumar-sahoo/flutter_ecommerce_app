import 'package:amazon/common/widgets/bottom_bar.dart';
import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/features/admin/screens/admin_screen.dart';
import 'package:amazon/features/auth/screens/auth._screen.dart';
import 'package:amazon/features/auth/services/auth_service.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider(
        create: (create) => UserProvider(),
      )
    ],
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Amazon',
        theme: ThemeData(
          scaffoldBackgroundColor: AppConstants.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: AppConstants.secondaryColor),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token!.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == "admin"
                ? const AdminScreen()
                : const BottomBar()
            : const AuthScreen());
  }
}
