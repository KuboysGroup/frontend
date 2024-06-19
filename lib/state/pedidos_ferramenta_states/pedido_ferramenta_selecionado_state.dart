import 'package:front_end/classes/pedido_ferramentas.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedido_ferramenta_selecionado_state.g.dart';

@riverpod
class PedidoFerramentaSelecionadoState
    extends _$PedidoFerramentaSelecionadoState {
  @override
  PedidoFerramentas? build() {
    return null;
  }

  void selecionarPedido(PedidoFerramentas pedido) {
    state = pedido;
  }

  void atualizarStatusPedido(String status) {
    if (state != null) {
      state = state!.copyWith(status: status);
    }
  }
}
