import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp( MyApp());
}
var password = "";
class Screen extends StatefulWidget {
   Screen({super.key});

  @override
  State<Screen> createState() => _MyAppState();
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      title: "Test",
      home: Screen(),
    );
  }
}

class _MyAppState extends State<Screen> {

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
        body: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xff94d500),
                child: IconButton(
                    onPressed: () {

                      showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return  AlertDialog(
                        title: const Text('Lütfen şifre girin.'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children:  <Widget>[
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                ),
                                keyboardType: TextInputType.number,
                               onChanged: (value) {
                                 password = value;
                                 
                               },
                              )
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('İptal'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Bağlan'),
                            onPressed: () {
                              if (password == "123456789") {
                                   var url = 'https://www.google.com.tr/';
                              launchUrl(Uri.parse(url));
                              }
                              else{
                                Get.snackbar("HATA", "Şifre Doğru Değil.",backgroundColor: Colors.red,colorText: Colors.white);
                              }
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
    },
  );
                      print("object");
                    
                    },
                    color: Colors.black,
                    hoverColor: Colors.black,
                    focusColor: Colors.black,
                    splashColor: Colors.black,
                    disabledColor: Colors.pink,
                    highlightColor: Colors.white,
                    icon: Icon(Icons.person_4_outlined)),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      );
    
  }
}
