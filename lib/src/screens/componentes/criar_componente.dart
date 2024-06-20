import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front_end/classes/componente.dart';
import 'package:front_end/classes/material.dart';
import 'package:front_end/network/requests/componentes_request.dart';
import 'package:front_end/state/componentes_states/componentes_state.dart';
import 'package:front_end/state/materiais_states/materiais_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../helpers/form_fields.dart';

class CriarComponenteScreen extends HookConsumerWidget {
  const CriarComponenteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final componentes = ref.watch(componentesStateProvider);
    final materiaisAsync = ref.watch(materiaisStateProvider);
    final nomeController = useTextEditingController();
    final quantController = useTextEditingController();

    final selectedMaterials = useState<List<MaterialEstoque>>([]);

    Future<void> criarComponente() async {
      if (nomeController.text.isEmpty ||
          quantController.text.isEmpty ||
          selectedMaterials.value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Preencha todos os campos!'),
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }

      final hasComponente = componentes.whenData((value) =>
          value.any((element) => element.nome == nomeController.text));

      hasComponente.whenData((value) async {
        if (value) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Componente já cadastrado!'),
              duration: Duration(seconds: 2),
            ),
          );
          return;
        }
        final item = Componente(
            nome: nomeController.text,
            composicao: selectedMaterials.value,
            quantEstoque: int.parse(quantController.text));
        try {
          await ComponentesRequest.createComponente(item);
          ref
              .read(componentesStateProvider.notifier)
              .adicionarComponentes(item);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Componente adicionado!'),
                duration: Duration(seconds: 2),
                backgroundColor: Color.fromARGB(255, 87, 160, 91)),
          );
          context.pop();
        } catch (err) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erro ao adicionar componente!'),
              duration: Duration(seconds: 2),
            ),
          );
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
                    'Adicionar componente',
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
                  const Text(
                    'Composição: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  materiaisAsync.when(
                    data: (materiais) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: materiais.length,
                        itemBuilder: (context, index) {
                          final material = materiais[index];
                          final isSelected =
                              selectedMaterials.value.contains(material);

                          return CheckboxListTile(
                            title: Text(material.nome.toString()),
                            value: isSelected,
                            onChanged: (bool? value) {
                              if (value == true) {
                                selectedMaterials.value =
                                    List.from(selectedMaterials.value)
                                      ..add(material);
                              } else {
                                selectedMaterials.value =
                                    List.from(selectedMaterials.value)
                                      ..remove(material);
                              }
                            },
                          );
                        },
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stack) => Text('Erro: $error'),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: const ButtonStyle(visualDensity: VisualDensity(vertical: 2)),
            onPressed: criarComponente,
            child: const Text(
              "Confirmar",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ]),
    );
  }
}
