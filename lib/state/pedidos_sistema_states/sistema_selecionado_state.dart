import 'package:front_end/classes/sistema_camara_quente.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sistema_selecionado_state.g.dart';

@riverpod
class SistemaSelecionadoState extends _$SistemaSelecionadoState {
  @override
  SistemaCamaraQuente? build() {
    return null;
  }

  void selecionarProduto(SistemaCamaraQuente produto) {
    state = produto;
  }
}
