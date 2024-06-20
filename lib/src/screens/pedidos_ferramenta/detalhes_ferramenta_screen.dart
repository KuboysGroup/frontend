import 'package:flutter/material.dart';
import 'package:front_end/state/pedidos_ferramenta_states/ferramenta_selecionada_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetalhesFerramentaScreen extends HookConsumerWidget {
  const DetalhesFerramentaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produtoSelecionado = ref.watch(ferramentaSelecionadaStateProvider);

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
                    buildRow("Tipo ferramenta",
                        produtoSelecionado?.tipoFerramenta.toString()),
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
                    buildRow("Composição",
                        produtoSelecionado.composicao!.nome.toString()),
                    buildRow("Revestimento",
                        produtoSelecionado.revestimento!.nome.toString()),
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
