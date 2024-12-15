import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'services/user_service.dart';
import 'services/auth_service.dart';
import 'views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final authService = AuthService();
  await authService.init(); 
  runApp(UserSearchApp(authService: authService));
}

class UserSearchApp extends StatelessWidget {
  final AuthService authService;

  const UserSearchApp({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => authService,
        ),
        Provider<UserService>(
          create: (context) {
            final authService = Provider.of<AuthService>(context, listen: false);
            return UserService(authService);
          },
        ),
      ],
      child: MaterialApp(
        title: 'User Search App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
        },
      ),
    );
  }
}
