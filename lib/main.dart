import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ikpmd/pages/debt_page.dart';
import 'package:ikpmd/pages/loaned_page.dart';
import 'package:ikpmd/providers/borrowed_user.dart';
import 'package:provider/provider.dart';
import 'package:ikpmd/pages/login_page.dart';
import 'package:ikpmd/pages/main_page.dart';
import 'package:ikpmd/pages/overview_page.dart';
import 'package:ikpmd/pages/register_page.dart';

Future main() async {
  await dotenv.load();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => BorrowedUsers())
    ], child: MyApp()),
  );
  // const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const Map<int, Color> colorMap = {
    50: Color.fromRGBO(42, 54, 59, 0.1),
    100: Color.fromRGBO(42, 54, 59, 0.2),
    200: Color.fromRGBO(42, 54, 59, 0.3),
    300: Color.fromRGBO(42, 54, 59, 0.4),
    400: Color.fromRGBO(42, 54, 59, 0.5),
    500: Color.fromRGBO(42, 54, 59, 0.6),
    600: Color.fromRGBO(42, 54, 59, 0.7),
    700: Color.fromRGBO(42, 54, 59, 0.8),
    800: Color.fromRGBO(42, 54, 59, 0.9),
    900: Color.fromRGBO(42, 54, 59, 1.0),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMoney',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF2A363B, colorMap),
      ),
      routes: {
        '/': (context) => const MainPage(),
        '/register': (context) => const RegisterPage(),
        '/main': (context) => const MainPage(),
        '/overview': (context) => const OverviewPage(),
        '/debt': (context) => const DebtPage(),
        '/loaned': (context) => const LoanPage(),
      },
    );
  }
}
