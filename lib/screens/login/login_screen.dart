import 'package:emprendi_app/components/input_base.dart';
import 'package:emprendi_app/routes/pages_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  final storage = GetStorage();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              Container(),
              //Titulo
              Text(
                'EmprendiApp',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Align(alignment: Alignment.centerLeft, child: Text('PIN')),
              Gap(4),
              InputBase(placeholder: 'PIN'),
              Gap(8),
              Align(alignment: Alignment.centerLeft, child: Text('Usuario')),
              Gap(4),
              InputBase(placeholder: 'Usuario'),
              Gap(8),
              Align(alignment: Alignment.centerLeft, child: Text('Contraseña')),
              Gap(4),
              InputBase(placeholder: 'Contraseña'),
              Gap(24),
              //Iniciar sesion
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  icon: FaIcon(
                    FontAwesomeIcons.rightToBracket,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  label: Text(
                    'Iniciar sesión',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  onPressed: () {
                    storage.write('token', '123456');
                    Get.offAllNamed(PagesRoutes.homeScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
