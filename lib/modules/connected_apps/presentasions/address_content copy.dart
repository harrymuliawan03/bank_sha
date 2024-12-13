import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/forms_widget.dart';
import 'package:flutter/material.dart';

class AddressContent extends StatefulWidget {
  // final UserModel user;

  const AddressContent({super.key});
  // const AddressContent({super.key, required this.user});

  @override
  State<AddressContent> createState() => _AddressContentState();
}

class _AddressContentState extends State<AddressContent> {
  final usernameController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Address',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kWhiteColor,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFormField(
                    title: 'Username',
                    controller: usernameController,
                    validator: (username) {
                      if (username == '' || username.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    title: 'Full Name',
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    title: 'Email Address',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    title: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Update Now',
                    // isLoading: state is AuthLoading ? true : false,
                    onPressed: () {
                      bool validate = _formKey.currentState!.validate();

                      if (validate) {
                        String username = usernameController.text;
                        String name = nameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        // context.read<AuthBloc>().add(
                        //       AuthUpdateUser(
                        //         user,
                        //         AddressFormModel(
                        //           username: username,
                        //           name: name,
                        //           email: email,
                        //           password: password,
                        //         ),
                        //       ),
                        //     );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
