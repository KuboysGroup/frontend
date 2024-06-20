import 'package:front_end/classes/ferramenta.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ferramenta_selecionada_state.g.dart';

@riverpod
class FerramentaSelecionadaState extends _$FerramentaSelecionadaState {
  @override
  Ferramenta? build() {
    return null;
  }

  void selecionarProduto(Ferramenta produto) {
    state = produto;
  }
}
