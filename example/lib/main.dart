import 'package:check_sign_up_format/check_sign_up_format.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'check sign up format',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CheckSignUpFormatTest(),
    );
  }
}

class CheckSignUpFormatTest extends StatefulWidget {
  const CheckSignUpFormatTest({super.key});

  @override
  State<CheckSignUpFormatTest> createState() => _CheckSignUpFormatTestState();
}

class _CheckSignUpFormatTestState extends State<CheckSignUpFormatTest> {
  final nameFormKey = GlobalKey<FormState>();
  final idFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final verifyPasswordFormKey = GlobalKey<FormState>();
  final phoneNumFormKey = GlobalKey<FormState>();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode idFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode verifyPasswordFocusNode = FocusNode();
  final FocusNode phoneNumFocusNode = FocusNode();

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController idTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController verifyPasswordTextController = TextEditingController();
  final TextEditingController phoneNumTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("check sign up format"),
      ),
      body: Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: Center(
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    testTextField(
                        'name',
                        nameFormKey,
                        nameFocusNode,
                        nameTextController,
                        Validator.nameValidator,
                        'input name',
                        false),
                    testTextField(
                        'id',
                        idFormKey,
                        idFocusNode,
                        idTextController,
                        Validator.idValidator,
                        'input id',
                        false),
                    testTextField(
                        'email',
                        emailFormKey,
                        emailFocusNode,
                        emailTextController,
                        Validator.emailValidator,
                        'input email',
                        false),
                    testTextField(
                        'password',
                        passwordFormKey,
                        passwordFocusNode,
                        passwordTextController,
                        Validator.passwordValidator,
                        'input password',
                        true),
                    testTextField(
                        'verify password',
                        verifyPasswordFormKey,
                        verifyPasswordFocusNode,
                        verifyPasswordTextController,
                        Validator.verifyPasswordValidator,
                        'input password',
                        true),
                    testTextField(
                        'phone number',
                        phoneNumFormKey,
                        phoneNumFocusNode,
                        passwordTextController,
                        Validator.phoneNumValidator,
                        'input phone number',
                        false),
                    checkButton()
                  ],
                )
            ),
          )),
    );
  }

  Widget testTextField(String title,
      GlobalKey? globalKey,
      FocusNode? focusNode,
      TextEditingController? controller,
      Function? validator,
      String hintText,
      bool isObscure) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 10),
        Form(
            key: globalKey,
            child: TextFormField(
              focusNode: focusNode,
              controller: controller,
              validator: (value) {
                if (title == 'verify password') {
                  return validator!(value, passwordTextController.text);
                }
                return validator!(value);
              },
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: const EdgeInsetsDirectional.all(20),
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: Colors.black12,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                errorStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                enabledBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              obscureText: isObscure,
            )),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget checkButton() {
    return ElevatedButton(
        onPressed: () {
          nameFormKey.currentState!.validate();
          idFormKey.currentState!.validate();
          emailFormKey.currentState!.validate();
          passwordFormKey.currentState!.validate();
          verifyPasswordFormKey.currentState!.validate();
          phoneNumFormKey.currentState!.validate();
        },
        child: const Text('check'));
  }
}
