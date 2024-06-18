import 'package:front_end/classes/produto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'produto_selecionado_state.g.dart';

@riverpod
class ProdutoSelecionadoState extends _$ProdutoSelecionadoState {
  @override
  Produto? build() {
    return null;
  }

  void selecionarProduto(Produto produto) {
    state = produto;
  }
}
