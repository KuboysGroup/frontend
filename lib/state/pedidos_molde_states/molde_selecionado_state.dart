import 'package:front_end/classes/molde.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'molde_selecionado_state.g.dart';

@riverpod
class MoldeSelecionadoState extends _$MoldeSelecionadoState {
  @override
  Molde? build() {
    return null;
  }

  void selecionarProduto(Molde produto) {
    state = produto;
  }
}
