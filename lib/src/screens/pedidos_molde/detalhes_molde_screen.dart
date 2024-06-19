import 'package:flutter/material.dart';
import 'package:front_end/state/pedidos_molde_states/molde_selecionado_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetalhesMoldeScreen extends HookConsumerWidget {
  const DetalhesMoldeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produtoSelecionado = ref.watch(moldeSelecionadoStateProvider);

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
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detalhes do produto',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
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
                  ],
                ),
              ),
              Text(produtoSelecionado!.toJson().toString())
            ],
          ),
        ],
      ),
    );
  }
}
