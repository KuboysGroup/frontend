import 'package:flutter/material.dart';
import 'package:front_end/state/produto_selecionado_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetalhesProdutoScreen extends HookConsumerWidget {
  const DetalhesProdutoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produtoSelecionado = ref.watch(produtoSelecionadoStateProvider);

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
                      'Detalhes do produto',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      '',
                      style: TextStyle(color: Colors.grey),
                    ),
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
