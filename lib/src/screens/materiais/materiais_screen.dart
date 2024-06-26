import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front_end/classes/material.dart';
import 'package:front_end/network/requests/materiais_request.dart';
import 'package:front_end/src/helpers/modals.dart';
import 'package:front_end/src/screens/materiais/criar_material.dart';
import 'package:front_end/state/materiais_states/materiais_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/form_fields.dart';

class MateriaisScreen extends HookConsumerWidget {
  const MateriaisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final materiais = ref.watch(materiaisStateProvider);
    final quantidadeController = useTextEditingController();

    void atualizarQuantidade(MaterialEstoque item) async {
      final itemAtualizado = MaterialEstoque(
          nome: item.nome, quantEstoque: int.parse(quantidadeController.text));
      List<MaterialEstoque> listaAtualizda = materiais.value!.map((e) {
        if (e.nome == item.nome) {
          return e.copyWith(quantEstoque: int.parse(quantidadeController.text));
        } else {
          return e;
        }
      }).toList();
      try {
        await MateriaisRequest.updateMaterial(listaAtualizda);
        ref
            .read(materiaisStateProvider.notifier)
            .atualizarMateriais(itemAtualizado);
        quantidadeController.clear();
      } catch (err) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao atualizar estoque!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Materiais',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            materiais.map(
              data: (data) {
                return Column(
                  children: [
                    ...data.value.map((material) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: ExpansionTile(
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: const Icon(FluentIcons.pipeline_20_regular),
                          ),
                          title: Text(material.nome.toString()),
                          subtitle: Text(
                              'Quantidade em estoque: ${material.quantEstoque.toString()}',
                              style: const TextStyle(color: Colors.grey)),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: QuantidadeTextFormField(
                                quantController: quantidadeController,
                                title: 'Alterar quantidade em estoque',
                                icon: Icons.numbers,
                                validate: true,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                    onPressed: () {
                                      atualizarQuantidade(material);
                                    },
                                    child: const Text('Confirmar')),
                              ),
                            )
                          ],
                        ),
                      );
                    })
                  ],
                );
              },
              error: (error) => Text("$error"),
              loading: (loading) => const Text('Carregando...'),
            )
          ],
        )
      ]),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(FluentIcons.add_12_regular),
        onPressed: () {
          KModal.show(body: const CriarMaterialScreen(), context: context);
        },
      ),
    );
  }
}
