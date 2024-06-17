import 'package:flutter/material.dart';
import 'package:front_end/src/helpers/status_manager.dart';
import 'package:front_end/state/pedido_selecionado_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PedidoSelecionadoScreen extends HookConsumerWidget {
  const PedidoSelecionadoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pedido = ref.watch(pedidoSelecionadoStateProvider);

    Widget buildRow(String title, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Flexible(
                child: Text(
              value,
              style: const TextStyle(color: Colors.grey),
            ))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detalhes do pedido ${pedido?.id}',
                    style: const TextStyle(fontSize: 25),
                  ),
                  const Text(
                    '',
                    style: TextStyle(color: Colors.grey),
                  ),
                  buildRow("Data do pedido:", pedido!.dataPedido.toString()),
                  buildRow("Prazo de entrega:", pedido.dataEntrega.toString()),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  const Text('LISTA DE PRODUTOS: '),
                  ...pedido.produtos!.map((produtoPedido) => ListTile(
                        title: Text(produtoPedido.produto!.nome.toString()),
                        subtitle: Text(
                            'Quantidade: ${produtoPedido.quantidade.toString()}'),
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('STATUS: '),
                      Text(pedido.status.toString()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
                    child: StepProgressIndicator(
                        roundedEdges: const Radius.circular(10.0),
                        totalSteps: 3,
                        currentStep: StatusManager.getStep(pedido.status),
                        selectedColor: StatusManager.getColor(pedido.status),
                        unselectedColor: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
