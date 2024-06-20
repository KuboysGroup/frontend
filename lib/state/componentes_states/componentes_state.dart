import 'package:front_end/classes/componente.dart';
import 'package:front_end/network/requests/componentes_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'componentes_state.g.dart';

@riverpod
class ComponentesState extends _$ComponentesState {
  @override
  Future<List<Componente>> build() async {
    return await ComponentesRequest.getComponentes();
  }

  void atualizarLista(List<Componente> listaComponentes) {
    state = AsyncValue.data(listaComponentes);
  }

  void adicionarComponentes(Componente componente) {
    state.whenData((componentes) {
      final updatedComponentes = [...componentes, componente];
      state = AsyncValue.data(updatedComponentes);
    });
  }

  void atualizarComponentes(Componente item) {
    state.whenData((componentes) {
      final updatedMateriais = componentes.map((element) {
        if (element.nome == item.nome) {
          return element.copyWith(quantEstoque: item.quantEstoque);
        } else {
          return element;
        }
      }).toList();
      state = AsyncValue.data(updatedMateriais);
    });
  }
}
