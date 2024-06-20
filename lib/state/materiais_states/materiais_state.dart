import 'package:front_end/classes/material.dart';
import 'package:front_end/network/requests/materiais_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'materiais_state.g.dart';

@riverpod
class MateriaisState extends _$MateriaisState {
  @override
  Future<List<MaterialEstoque>> build() async {
    return await MateriaisRequest.getMateriais();
  }

  void atualizarLista(List<MaterialEstoque> listaMateriais) {
    state = AsyncValue.data(listaMateriais);
  }

  void adicionarMaterial(MaterialEstoque material) {
    state.whenData((materiais) {
      final updatedMateriais = [...materiais, material];
      state = AsyncValue.data(updatedMateriais);
    });
  }

  void atualizarMateriais(MaterialEstoque item) {
    state.whenData((materiais) {
      final updatedMateriais = materiais.map((element) {
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
