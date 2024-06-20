import 'package:front_end/classes/pedido_sistema_camara_quente.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedido_sistema_selecionado_state.g.dart';

@riverpod
class PedidoSistemaSelecionadoState extends _$PedidoSistemaSelecionadoState {
  @override
  PedidoSistemaCaramaQuente? build() {
    return null;
  }

  void selecionarPedido(PedidoSistemaCaramaQuente pedido) {
    state = pedido;
  }

  void atualizarStatusPedido(String status) {
    if (state != null) {
      state = state!.copyWith(status: status);
    }
  }
}
