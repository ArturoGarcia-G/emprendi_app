import 'package:emprendi_app/components/input_base.dart';
import 'package:emprendi_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  final storage = GetStorage();

  // Controllers para los inputs
  final pinCtrl = TextEditingController();
  final usuarioCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

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
              InputBase(controller: pinCtrl, placeholder: 'PIN'),
              Gap(8),
              Align(alignment: Alignment.centerLeft, child: Text('Usuario')),
              Gap(4),
              InputBase(controller: usuarioCtrl, placeholder: 'Usuario'),
              Gap(8),
              Align(alignment: Alignment.centerLeft, child: Text('Contraseña')),
              Gap(4),
              InputBase(controller: passwordCtrl, placeholder: 'Contraseña'),
              Gap(24),
              //Iniciar sesion
              SizedBox(
                width: double.infinity,
                height: 48,
                child: Obx(() {
                  return ElevatedButton.icon(
                    icon: authController.isLoading.value
                        ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : FaIcon(
                            FontAwesomeIcons.rightToBracket,
                            color: Colors.white,
                          ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      textStyle: TextStyle(fontSize: 16),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    label: Text(
                      authController.isLoading.value
                          ? 'Cargando...'
                          : 'Iniciar sesión',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    onPressed: () {
                      authController.iniciarSesion(
                        pin: pinCtrl.text,
                        usuario: usuarioCtrl.text,
                        password: passwordCtrl.text,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
