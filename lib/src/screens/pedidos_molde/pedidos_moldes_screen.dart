import 'package:flutter/material.dart';
import 'package:front_end/src/helpers/status_manager.dart';
import 'package:front_end/state/pedidos_molde_states/pedido_molde_selecionado_state.dart';
import 'package:front_end/state/pedidos_molde_states/pedidos_moldes_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PedidosMoldesScreen extends HookConsumerWidget {
  const PedidosMoldesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pedidosList = ref.watch(pedidosMoldesStateProvider);

    ref.watch(pedidoMoldeSelecionadoStateProvider);

    Widget buildSubtitle(
        String? dataPedido, String? dataEntrega, String? status) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Data pedido:",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(dataPedido.toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.grey))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Status",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(status.toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.grey))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Data entrega:",
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text(dataEntrega.toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.grey))
            ],
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pedidos de Moldes',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      'Gerencie seus pedidos',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              pedidosList.when(
                  data: (data) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 8.0,
                        ),
                        ...data.map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                leading: CircularStepProgressIndicator(
                                  totalSteps: 3,
                                  currentStep: StatusManager.getStep(e.status),
                                  stepSize: 10,
                                  selectedColor:
                                      StatusManager.getColor(e.status),
                                  unselectedColor: Colors.grey[200],
                                  padding: 0,
                                  width: 70,
                                  height: 70,
                                  unselectedStepSize: 5,
                                  selectedStepSize: 5,
                                  child: Center(
                                    child: StatusManager.getDescr(e.status),
                                  ),
                                ),
                                visualDensity: const VisualDensity(vertical: 4),
                                onTap: () {
                                  ref
                                      .read(pedidoMoldeSelecionadoStateProvider
                                          .notifier)
                                      .selecionarPedido(e);
                                  context.go(
                                      '/pedidos_moldes/pedido_molde_selecionado');
                                },
                                title: Text('ID Pedido: ${e.id}'),
                                subtitle: buildSubtitle(
                                    e.dataPedido, e.dataEntrega, e.status),
                              ),
                            ))
                      ],
                    );
                  },
                  error: (error, stacktrace) =>
                      Text('Erro ao carregar pedidos: $error'),
                  loading: () => const Center(child: Text('carregando...')))
            ],
          ),
        ],
      ),
    );
  }
}
