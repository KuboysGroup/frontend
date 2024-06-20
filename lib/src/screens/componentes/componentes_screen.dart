import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front_end/classes/componente.dart';
import 'package:front_end/network/requests/componentes_request.dart';
import 'package:front_end/src/helpers/modals.dart';
import 'package:front_end/src/screens/materiais/criar_material.dart';
import 'package:front_end/state/componentes_states/componentes_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/form_fields.dart';

class ComponentesScreen extends HookConsumerWidget {
  const ComponentesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final componentes = ref.watch(componentesStateProvider);
    final quantidadeController = useTextEditingController();

    void atualizarQuantidade(Componente item) async {
      final itemAtualizado = Componente(
          nome: item.nome,
          composicao: item.composicao,
          quantEstoque: int.parse(quantidadeController.text));
      List<Componente> listaAtualizda = componentes.value!.map((e) {
        if (e.nome == item.nome) {
          return e.copyWith(quantEstoque: int.parse(quantidadeController.text));
        } else {
          return e;
        }
      }).toList();
      try {
        await ComponentesRequest.updateComponente(listaAtualizda);
        ref
            .read(componentesStateProvider.notifier)
            .atualizarComponentes(itemAtualizado);
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
                    'Componentes',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            componentes.map(
              data: (data) {
                return Column(
                  children: [
                    ...data.value.map((componente) {
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
                            child:
                                const Icon(FluentIcons.puzzle_piece_20_regular),
                          ),
                          title: Text(componente.nome.toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quantidade em estoque: ${componente.quantEstoque.toString()}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Text(
                                  'Composição: ${componente.composicao!.first.nome}',
                                  style: const TextStyle(color: Colors.grey))
                            ],
                          ),
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
                                      atualizarQuantidade(componente);
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
