import 'package:ex_login/res/strings.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController userField = TextEditingController(text: '');
  TextEditingController passwField = TextEditingController(text: '');
  final String userDB = 'Ciro';
  final String passwDB = '123456';
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: userField,
                    decoration: buildFieldDecoration(Strings.title),
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: passwField,
                    decoration: buildFieldDecoration(Strings.password).copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () => setState(() => isVisible = !isVisible),
                      ),
                    ),
                    obscureText: isVisible,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: logIn,
                    child: const Text(Strings.logIn),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildFieldDecoration(String label) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      labelText: label,
    );
  }

  void logIn() {
    if (userField.text.isEmpty) {
      showUserDialog(Strings.emptyUser);
      return;
    }
    if (passwField.text.isEmpty) {
      showUserDialog(Strings.emptyPassw);
      return;
    }
    if (userField.text != userDB || passwField.text != passwDB) {
      showUserDialog(Strings.invalid);
      return;
    }
    if (userField.text == userDB && passwField.text == passwDB) {
      showUserDialog(Strings.acceptedUser);
    }
  }

  void showUserDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );
  }
}
