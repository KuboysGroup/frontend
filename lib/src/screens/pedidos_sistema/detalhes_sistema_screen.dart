import 'package:flutter/material.dart';
import 'package:front_end/state/pedidos_sistema_states/sistema_selecionado_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetalhesSistemaScreen extends HookConsumerWidget {
  const DetalhesSistemaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produtoSelecionado = ref.watch(sistemaSelecionadoStateProvider);

    Widget buildRow(String title, String? value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            Flexible(
                child: Text(
              value.toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ))
          ],
        ),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detalhes do produto',
                      style: TextStyle(fontSize: 25),
                    ),
                    const Text(
                      '',
                      style: TextStyle(color: Colors.grey),
                    ),
                    buildRow("Nome", produtoSelecionado?.nome.toString()),
                    buildRow("Altura",
                        produtoSelecionado!.dimensoes!.altura.toString()),
                    buildRow("Largura",
                        produtoSelecionado.dimensoes!.largura.toString()),
                    buildRow("Profundidade",
                        produtoSelecionado.dimensoes!.profundidade.toString()),
                    buildRow(
                        "Nec. Tratamento térmico",
                        produtoSelecionado.tratamentoTermico == true
                            ? "Sim"
                            : "Não"),
                    buildRow(
                        "Material da resistência",
                        produtoSelecionado.materialResistencia!.nome
                            .toString()),
                    buildRow("Temperatuda de operação",
                        produtoSelecionado.tempOperacao.toString()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
