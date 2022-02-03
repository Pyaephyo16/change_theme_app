import 'package:change_theme_app/page/home_page.dart';
import 'package:change_theme_app/provider/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => ChangeTheme(),
        ),
      ],
          child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ChangeTheme ctheme = Provider.of<ChangeTheme>(context,listen: false);
    ctheme.CheckThemeData;

    return Consumer<ChangeTheme>(
      builder: (context,ChangeTheme ct,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          themeMode: ct.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.teal,
            primaryColor: Colors.teal,
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.pink,
            primaryColor: Colors.pink,
          ),
        );
      },
    );
  }
}




