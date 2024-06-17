import 'package:flutter/material.dart';
import 'package:front_end/classes/pedido.dart';
import 'package:front_end/network/requests/pedidos_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pedidosListProvider =
    FutureProvider.autoDispose<List<Pedido>>((ref) async {
  return await PedidosRequest.getItem();
});

class PedidosScreen extends HookConsumerWidget {
  const PedidosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pedidosList = ref.watch(pedidosListProvider);
    // final pedidosNotifier = ref.read(pedidosProvider.notifier);

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
                const Text(
                  'Gerencie seus pedidos',
                  style: TextStyle(color: Colors.grey),
                ),
                pedidosList.when(
                    data: (data) {
                      return Column(
                        children: [...data.map((e) => Text(e.id.toString()))],
                      );
                    },
                    error: (error, stacktrace) =>
                        Text('Erro ao carregar contas a pagar: $error'),
                    loading: () => const Text('carregando...'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
