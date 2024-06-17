import 'package:flutter/material.dart';
import 'package:front_end/providers/pedido_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PedidosScreen extends HookConsumerWidget {
  const PedidosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pedidos = ref.watch(pedidosProvider);
    final pedidosNotifier = ref.read(pedidosProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pedidos',
                  style: TextStyle(fontSize: 25),
                ),
                if (pedidos.isEmpty)
                  const Text(
                    'Nenhum pedido encontrado.',
                    style: TextStyle(color: Colors.grey),
                  )
                else
                  ...pedidos.map((pedido) => ListTile(
                        title: Text('Pedido ${pedido.id}'),
                        subtitle: Text('Status: ${pedido.status}'),
                      )),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await pedidosNotifier.getPedidos();
                  },
                  child: const Text("Carregar Pedidos"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
