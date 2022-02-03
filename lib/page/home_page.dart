import 'package:change_theme_app/provider/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    ChangeTheme ct = Provider.of(context,listen: false);
    ct.CheckThemeData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Light/Dark Sample"),
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
              Center(
                child: Consumer<ChangeTheme>(
                  builder: (context,ChangeTheme ct,child){
                    return Column(
                      children: [
                        ToggleButtons(
                            constraints: BoxConstraints(
                              minHeight: 60,
                              minWidth: 80,
                              maxHeight: 120,
                              maxWidth: 120,
                            ),
                            selectedBorderColor: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(12),
                            children: [
                              Icon(Icons.wb_sunny),
                              Icon(Icons.dark_mode_outlined),
                            Icon(Icons.system_update_outlined),
                            ],
                          isSelected: [
                              ct.themeMode == ThemeMode.light,
                            ct.themeMode == ThemeMode.dark,
                            ct.themeMode == ThemeMode.system,
                          ],
                          onPressed: (index) {
                            if(index == 0){
                              ct.ChangeLightTheme();
                            }else if(index == 1){
                              ct.ChangeDarkTheme();
                            }else{
                              ct.ChangeSystemTheme();
                            }
                          },
                        ),
                        SizedBox(height: 20,),
                        Text("ThemeMode.${ct.name}",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                        ),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
