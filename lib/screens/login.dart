import 'package:dice_app/screens/dice.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // TextField 에 입력된 값을 읽어야 할 때는 TextEditingController 를 사용합니다
  // TextEditingController 를 생성해 TextField 와 연결해야합니다.
  // TextEditingController 생성자를 통해 instance 를 만듭니다.
  // TextEditingController 를 생성하고 나서 더 이상 사용하지 않을 때는
  // Resource 낭비를 막기위해 dispose 메소드를 해줘야합니다. (여기서는 간단한 앱이기에 생략)
  // Stateful Widget life cycle 을 다룰 때 더 자세히 언급 및 사용하겠습니다.
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Log In'),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/chef.gif'),
                      width: 170,
                      height: 190,
                    ),
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.teal,
                        inputDecorationTheme: const InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.teal, fontSize: 15)),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextField(
                              // 컨트롤러 추가 1
                              controller: idController,
                              decoration: const InputDecoration(
                                labelText: 'Enter "Dice"',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              // 컨트롤러 추가 1
                              controller: pwController,
                              decoration: const InputDecoration(
                                labelText: 'Enter "Password"',
                              ),
                              keyboardType: TextInputType.text,
                              // 비밀번호 등의 보안을 위해 Input 에 Masking 해줄때
                              // obscureText 를 true 로 해줍니다.
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ButtonTheme(
                              minWidth: 100,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (idController.text == 'dice' &&
                                      pwController.text == '1234') {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return const Dice();
                                    }));
                                  } else if (idController.text != 'dice' &&
                                      pwController.text != '1234') {
                                    showSnackBar(context);
                                  } else if (idController.text != 'dice' &&
                                      pwController.text == '1234') {
                                    showSnackBar2(context);
                                  } else {
                                    showSnackBar3(context);
                                  }
                                },
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Colors.deepOrangeAccent,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      '로그인 정보를 다시 확인하세요.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.amber,
  ));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      '비밀번호가 일치하지 않습니다.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.amber,
  ));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      'dice의 철자를 확인하세요.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.amber,
  ));
}
