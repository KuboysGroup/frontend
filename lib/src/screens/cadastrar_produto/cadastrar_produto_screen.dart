import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CadastrarProdutoScreen extends HookConsumerWidget {
  const CadastrarProdutoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Produtos',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Colors.grey),
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
