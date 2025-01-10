import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfire/Theme/controller.dart';
import 'package:newfire/Theme/data.dart';
void main(){
  runApp(GetMaterialApp(
    title: 'flutter demo',
    theme: CustomTheme.lightTheme,
    darkTheme: CustomTheme.darkTheme,
    themeMode: ThemeMode.system,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Obx(
                () => Text(controller.currentTheme.value == ThemeMode.dark
                ?"Dark Theme"
                :"Light Theme")
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tap on the switch to change the theme",
              style: TextStyle(
                  fontSize: size.height*0.02),
            ),
            Obx(
                    () =>Switch(
                  value: controller.currentTheme.value == ThemeMode.dark,
                  onChanged: (value){
                    controller.switchTheme();
                    Get.changeThemeMode(controller.currentTheme.value);
                  },
                  activeColor: CustomTheme.white,
                )
            )
          ],
        ),
      ),
    );
  }
  @override
  void Dispose(){
    controller.dispose();
    super == dispose;
  }
}
