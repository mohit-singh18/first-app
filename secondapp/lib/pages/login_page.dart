import 'package:flutter/material.dart';
import 'package:secondapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool unchanged = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        unchanged = true;
      });
      // ignore: prefer_const_constructors
      await Future.delayed(Duration(milliseconds: 500));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homePage);
      setState(() {
        unchanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Image.asset("assets/images/login_page.png", fit: BoxFit.cover),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Welcome${name.isNotEmpty ? ", $name" : ""}",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return "Please Enter the UserName";
                      }
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter UserName", label: Text("UserName")),
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return "Please Enter the PassWord";
                      } else if (value.length < 8) {
                        return "Please Enter Atleast 8 characters";
                      }
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter PassWord", label: Text("PassWord")),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    // ignore: prefer_const_constructors
                    duration: Duration(milliseconds: unchanged ? 250 : 0),
                    // ignore: sort_child_properties_last
                    child: unchanged
                        // ignore: prefer_const_constructors
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        // ignore: prefer_const_constructors
                        : Text(
                            "Login",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                    alignment: Alignment.center,
                    width: unchanged ? 50 : 120,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(unchanged ? 50 : 8)),
                  ),
                )
                // ElevatedButton(
                //     // ignore: sort_child_properties_last
                //     child: const Text(
                //       "Login",
                //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //     ),
                //     style: TextButton.styleFrom(minimumSize: const Size(120, 40)),
                //     onPressed: () {
                //       Navigator.pushNamed(context, MyRoutes.homePage);
                //     })
              ],
            ),
          ),
        )
      ],
    ));
  }
}
