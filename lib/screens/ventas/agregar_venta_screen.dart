import 'package:dropdown_search/dropdown_search.dart';
import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/card_base.dart';
import 'package:emprendi_app/components/input_base.dart';
import 'package:emprendi_app/components/secundary_app_bar.dart';
import 'package:emprendi_app/controllers/cliente_controller.dart';
import 'package:emprendi_app/controllers/producto_controller.dart';
import 'package:emprendi_app/controllers/venta_controller.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/models/cliente.dart';
import 'package:emprendi_app/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

// Modelo temporal para items del carrito
class CarritoItem {
  final Producto producto;
  int cantidad;

  CarritoItem({required this.producto, this.cantidad = 1});

  double get subtotal => (producto.precio ?? 0.0) * cantidad;
}

class AgregarVentaScreen extends StatefulWidget {
  const AgregarVentaScreen({super.key});

  @override
  State<AgregarVentaScreen> createState() => _AgregarVentaScreenState();
}

class _AgregarVentaScreenState extends State<AgregarVentaScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
  final clienteController = Get.find<ClienteController>();
  final productoController = Get.find<ProductoController>();
  final ventaController = Get.find<VentaController>();

  // Controllers de inputs
  final busquedaProductoCtrl = TextEditingController();

  // Variables de estado
  Cliente? clienteSeleccionado;
  String formaPago = 'efectivo';
  List<CarritoItem> carrito = [];
  List<Producto> productosBusqueda = [];

  @override
  void initState() {
    super.initState();

    // Cargar datos iniciales
    WidgetsBinding.instance.addPostFrameCallback((_) {
      clienteController.listarClientes();
      productoController.listarProductos();
    });

    // Listener para busqueda de productos
    busquedaProductoCtrl.addListener(_buscarProductos);
  }

  void _buscarProductos() {
    if (busquedaProductoCtrl.text.isEmpty) {
      setState(() {
        productosBusqueda = [];
      });
      return;
    }

    final query = busquedaProductoCtrl.text.toLowerCase();
    setState(() {
      productosBusqueda = productoController.productos
          .where(
            (p) =>
                (p.nombre?.toLowerCase().contains(query) ?? false) ||
                (p.sku?.toLowerCase().contains(query) ?? false),
          )
          .take(5)
          .toList();
    });
  }

  void _agregarAlCarrito(Producto producto) {
    final index = carrito.indexWhere(
      (item) => item.producto.productoId == producto.productoId,
    );

    setState(() {
      if (index >= 0) {
        carrito[index].cantidad++;
      } else {
        carrito.add(CarritoItem(producto: producto));
      }
    });
  }

  void _incrementarCantidad(int index) {
    setState(() {
      carrito[index].cantidad++;
    });
  }

  void _decrementarCantidad(int index) {
    setState(() {
      if (carrito[index].cantidad > 1) {
        carrito[index].cantidad--;
      } else {
        carrito.removeAt(index);
      }
    });
  }

  void _eliminarDelCarrito(int index) {
    setState(() {
      carrito.removeAt(index);
    });
  }

  double get total {
    return carrito.fold(0.0, (sum, item) => sum + item.subtotal);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const SecundaryAppBar(titulo: 'Nueva venta'),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Contenido principal con scroll
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Selección de cliente
                    CardBase(
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Selector de cliente
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Seleccionar cliente',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  const Gap(4),
                                  Obx(() {
                                    final clientes = clienteController.clientes
                                        .where((c) => c.status == 'activo')
                                        .toList();

                                    return SizedBox(
                                      height: 35,
                                      child: DropdownSearch<Cliente>(
                                        selectedItem: clienteSeleccionado,
                                        items: (filter, infiniteScrollProps) =>
                                            clientes
                                                .where(
                                                  (cliente) =>
                                                      filter.isEmpty ||
                                                      (cliente.nombre ?? '')
                                                          .toLowerCase()
                                                          .contains(
                                                            filter
                                                                .toLowerCase(),
                                                          ),
                                                )
                                                .toList(),
                                        itemAsString: (Cliente? cliente) =>
                                            cliente?.nombre ?? 'Sin nombre',
                                        compareFn:
                                            (Cliente? item1, Cliente? item2) {
                                              if (item1 == null &&
                                                  item2 == null) {
                                                return true;
                                              }
                                              if (item1 == null ||
                                                  item2 == null) {
                                                return false;
                                              }
                                              return item1.clienteId ==
                                                  item2.clienteId;
                                            },
                                        popupProps: const PopupProps.menu(
                                          fit: FlexFit.loose,
                                          constraints: BoxConstraints(
                                            maxHeight: 300,
                                          ),
                                          showSearchBox: true,
                                          searchFieldProps: TextFieldProps(
                                            decoration: InputDecoration(
                                              hintText: 'Buscar...',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 6,
                                                  ),
                                              border: OutlineInputBorder(),
                                              isDense: true,
                                            ),
                                          ),
                                        ),
                                        onChanged: (Cliente? value) {
                                          setState(() {
                                            clienteSeleccionado = value;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Selecciona un cliente';
                                          }
                                          return null;
                                        },
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                            const Gap(12),
                            // Forma de pago
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Forma de Pago',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  const Gap(4),
                                  DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                    ),
                                    style: const TextStyle(fontSize: 12),
                                    value: formaPago,
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'efectivo',
                                        child: Text(
                                          'Efectivo',
                                          style: TextStyle(fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'transferencia',
                                        child: Text(
                                          'Transfer.',
                                          style: TextStyle(fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'tarjeta',
                                        child: Text(
                                          'Tarjeta',
                                          style: TextStyle(fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                    onChanged: (String? value) {
                                      setState(() {
                                        formaPago = value ?? 'efectivo';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(16),

                    // Búsqueda de productos
                    CardBase(
                      titulo: 'Productos Disponibles',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Buscar Producto'),
                          const Gap(4),
                          InputBase(
                            controller: busquedaProductoCtrl,
                            placeholder: 'Buscar por nombre o SKU...',
                          ),
                          const Gap(8),

                          // Resultados de búsqueda
                          if (productosBusqueda.isNotEmpty) ...[
                            const Text(
                              'Resultados:',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const Gap(8),
                            ...productosBusqueda.map(
                              (producto) => Card(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: ListTile(
                                  dense: true,
                                  title: Text(producto.nombre ?? 'Sin nombre'),
                                  subtitle: Text(
                                    'SKU: ${producto.sku ?? 'N/A'}   • \$${producto.precio?.toStringAsFixed(2) ?? '0.00'}',
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: colorVerde500,
                                    ),
                                    onPressed: () =>
                                        _agregarAlCarrito(producto),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const Gap(16),

                    // Carrito de compras
                    if (carrito.isNotEmpty)
                      CardBase(
                        titulo: 'Carrito de Ventas (${carrito.length})',
                        child: Column(
                          children: carrito.asMap().entries.map((entry) {
                            final index = entry.key;
                            final item = entry.value;

                            return Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              color: colorVerde900.withAlpha(10),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Info del producto
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item.producto.nombre ?? 'Sin nombre',
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  _decrementarCantidad(index),
                                              icon: const Icon(
                                                Icons.remove_circle_outline,
                                              ),
                                              iconSize: 20,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                    vertical: 3,
                                                  ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: colorGris300,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                '${item.cantidad}',
                                                style: textTheme.bodyMedium,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  _incrementarCantidad(index),
                                              icon: const Icon(
                                                Icons.add_circle_outline,
                                              ),
                                              iconSize: 20,
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  _eliminarDelCarrito(index),
                                              icon: const Icon(
                                                Icons.delete_outline,
                                                color: colorRojo900,
                                              ),
                                              iconSize: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$${item.producto.precio?.toStringAsFixed(2) ?? '0.00'} c/u',
                                          style: textTheme.bodySmall?.copyWith(
                                            color: colorGris,
                                          ),
                                        ),
                                        Text(
                                          '\$${item.subtotal.toStringAsFixed(2)}',
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colorVerde500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                    // Espacio para el footer
                    const Gap(100),
                  ],
                ),
              ),
            ),

            // Footer fijo
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(top: BorderSide(color: colorScheme.outline)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorVerde500,
                        ),
                      ),
                    ],
                  ),
                  const Gap(12),

                  // Botones
                  Row(
                    children: [
                      Expanded(
                        child: BotonBase(
                          label: 'Cancelar',
                          fn: () => Get.back(),
                          tipo: BotonTipo.secundario,
                        ),
                      ),
                      const Gap(12),
                      Expanded(
                        child: Obx(() => BotonBase(
                          label: 'Completar venta',
                          isLoading: ventaController.isLoading.value,
                          fn: () async {
                            if (carrito.isEmpty) {
                              Get.snackbar(
                                'Error', 
                                'Debe agregar al menos un producto al carrito',
                                backgroundColor: Colors.red.withOpacity(0.1),
                              );
                              return;
                            }
                            
                            if (clienteSeleccionado == null) {
                              Get.snackbar(
                                'Error', 
                                'Debe seleccionar un cliente',
                                backgroundColor: Colors.red.withOpacity(0.1),
                              );
                              return;
                            }

                            if (_formKey.currentState?.validate() ?? false) {
                              // Preparar datos de productos
                              final productos = carrito.map((item) => {
                                'productoId': item.producto.productoId,
                                'cantidad': item.cantidad,
                                'precioUnitario': item.producto.precio ?? 0.0,
                              }).toList();

                              try {
                                await ventaController.agregarVenta(
                                  clienteId: clienteSeleccionado!.clienteId!,
                                  formaPago: formaPago,
                                  productos: productos,
                                );
                                
                                Get.back();
                              } catch (e) {
                                // Error already handled in controller
                              }
                            }
                          },
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    busquedaProductoCtrl.dispose();
    super.dispose();
  }
}
