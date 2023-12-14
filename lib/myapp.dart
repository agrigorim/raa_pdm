import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raa_pdm/pages/home_page.dart';
import 'package:raa_pdm/pages/login_page.dart';
import 'package:raa_pdm/services/auth_service.dart';

import 'package:raa_pdm/widgets/auth_check.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reclamações UTFPR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      navigatorKey: _navigator,
      home: const HomePage(),
      builder: (context, child) {
        final auth = context.watch<AuthService>();
        return Navigator(
          onPopPage: (_, dynamic __) => true,
          pages: [
            if (auth.isLoading)
              const MaterialPage(
                child: Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )

            // ...

            else if (auth.usuario == null)
              MaterialPage(
                child: LoginPage(),
              )
            else if (auth.usuario != null)
              MaterialPage(
                child: HomePage(),
              )
            else
              MaterialPage(
                child: Scaffold(
                  body: Center(
                    child: Text('Erro desconhecido'),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
