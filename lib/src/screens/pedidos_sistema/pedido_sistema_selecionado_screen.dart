import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:front_end/classes/pedido_sistema_camara_quente.dart';
import 'package:front_end/network/requests/alterar_status_request.dart';
import 'package:front_end/src/helpers/status_manager.dart';
import 'package:front_end/state/pedidos_sistema_states/pedido_sistema_selecionado_state.dart';
import 'package:front_end/state/pedidos_sistema_states/pedidos_sistemas_state.dart';
import 'package:front_end/state/pedidos_sistema_states/sistema_selecionado_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PedidoSistemaSelecionadoScreen extends HookConsumerWidget {
  const PedidoSistemaSelecionadoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pedido = ref.watch(pedidoSistemaSelecionadoStateProvider);
    ref.watch(pedidosSistemasStateProvider);
    const List<String> list = <String>[
      'EM_ABERTO',
      'EM_PRODUCAO',
      'FINALIZADO',
      'CANCELADO'
    ];

    final dropdownValue = ref.watch(dropdownProvider);
    final dropdownNotifier = ref.read(dropdownProvider.notifier);
    ref.watch(sistemaSelecionadoStateProvider);

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

    void atualizarState(PedidoSistemaCaramaQuente pedido) async {
      final updatedPedido = PedidoSistemaCaramaQuente(
          id: pedido.id,
          dataEntrega: pedido.dataEntrega,
          dataPedido: pedido.dataPedido,
          status: dropdownValue,
          produtos: pedido.produtos);
      ref
          .read(pedidoSistemaSelecionadoStateProvider.notifier)
          .atualizarStatusPedido(dropdownValue);
      ref
          .read(pedidosSistemasStateProvider.notifier)
          .atualizarPedidos(updatedPedido);
      print(updatedPedido.produtos?.first.toJson());
      await AtualizarStatusPedidoRequest.atualizarStatusPedidoSistema(
          updatedPedido.id, updatedPedido);
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
                  const Text('Lista de produtos: '),
                  ...pedido.produtos!.map((produtoPedido) => ListTile(
                        leading: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child:
                              const Icon(FluentIcons.tray_item_add_20_regular),
                        ),
                        title: Text(produtoPedido.nome.toString()),
                        subtitle: Text(
                            'Quantidade: ${produtoPedido.quantidade.toString()}'),
                        onTap: () {
                          ref
                              .read(sistemaSelecionadoStateProvider.notifier)
                              .selecionarProduto(produtoPedido);
                          context.go(
                              '/pedidos_sistemas/pedido_sistema_selecionado/detalhes_sistema');
                        },
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Status: '),
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
                  const Text('Alterar status:'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                            value: dropdownValue,
                            elevation: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black87),
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                dropdownNotifier.updateValue(value);
                              }
                            }),
                        ElevatedButton(
                            onPressed: () {
                              atualizarState(pedido);
                            },
                            child: const Text('Confirmar'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class DropdownStateNotifier extends StateNotifier<String> {
  DropdownStateNotifier() : super('EM_ABERTO');

  void updateValue(String newValue) {
    state = newValue;
  }
}

final dropdownProvider =
    StateNotifierProvider<DropdownStateNotifier, String>((ref) {
  return DropdownStateNotifier();
});
