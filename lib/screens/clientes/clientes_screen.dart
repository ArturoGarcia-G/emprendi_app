import 'package:emprendi_app/components/primary_app_bar.dart';
import 'package:emprendi_app/components/primary_drawer.dart';
import 'package:emprendi_app/controllers/cliente_controller.dart';
import 'package:emprendi_app/screens/clientes/modales/modal_agregar_cliente.dart';
import 'package:emprendi_app/screens/clientes/widgets/card_cliente.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  final storage = GetStorage();

  final clienteController = Get.find<ClienteController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      clienteController.listarClientes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const PrimaryAppBar(avatarUrl: ''),
      drawer: const PrimaryDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) {
              return const ModalAgregarCliente();
            },
          );

          if (result == true) {
            clienteController.listarClientes();
          }
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Clientes', style: textTheme.bodyLarge),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(() {
                final clientes = clienteController.clientes;

                if (clienteController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (clientes.isEmpty) {
                  return const Center(
                    child: Text('No hay clientes disponibles'),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await clienteController.listarClientes();
                  },
                  child: ListView.separated(
                    itemCount: clientes.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                    itemBuilder: (context, index) {
                      final cliente = clientes[index];
                      return CardCliente(cliente: cliente);
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
