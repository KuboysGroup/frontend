// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front_end/classes/material.dart';
import 'package:front_end/network/requests/materiais_request.dart';
import 'package:front_end/src/helpers/snackbar.dart';
import 'package:front_end/state/materiais_states/materiais_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../helpers/form_fields.dart';

class CriarMaterialScreen extends HookConsumerWidget {
  const CriarMaterialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final materiais = ref.watch(materiaisStateProvider);
    final nomeController = useTextEditingController();
    final quantController = useTextEditingController();

    Future<void> criarMaterial() async {
      if (nomeController.text.isEmpty || quantController.text.isEmpty) {
        KSnackBar.showCustomSnackbar(context, "Preencha todos os campos");
        return;
      }

      final temMaterial = materiais.whenData((value) =>
          value.any((element) => element.nome == nomeController.text));

      temMaterial.whenData((value) async {
        if (value) {
          KSnackBar.showCustomSnackbar(context, "Material já cadastrado");
          return;
        }
        final item = MaterialEstoque(
            nome: nomeController.text,
            quantEstoque: int.parse(quantController.text));
        try {
          await MateriaisRequest.createMaterial(item);
          ref.read(materiaisStateProvider.notifier).adicionarMaterial(item);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Material adicionado!'),
                duration: Duration(seconds: 2),
                backgroundColor: Color.fromARGB(255, 87, 160, 91)),
          );
          context.pop();
        } catch (err) {
          KSnackBar.showCustomSnackbar(context, "Erro ao cadastrar material");
        }
      });
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
                  const Text(
                    'Adicionar material',
                    style: TextStyle(fontSize: 25),
                  ),
                  const Text(
                    '',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Nome: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FieldTextFormField(
                      textController: nomeController,
                      title: '',
                      icon: Icons.numbers,
                    ),
                  ),
                  const Text(
                    'Quantidade em estoque: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: QuantidadeTextFormField(
                      quantController: quantController,
                      title: '',
                      icon: Icons.numbers,
                      validate: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              style:
                  const ButtonStyle(visualDensity: VisualDensity(vertical: 2)),
              onPressed: () {
                criarMaterial();
              },
              child: const Text(
                "Confirmar",
                style: TextStyle(fontSize: 16.0),
              )),
        )
      ]),
    );
  }
}
