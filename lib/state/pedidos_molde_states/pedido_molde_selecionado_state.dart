import 'package:front_end/classes/pedido_moldes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedido_molde_selecionado_state.g.dart';

@riverpod
class PedidoMoldeSelecionadoState extends _$PedidoMoldeSelecionadoState {
  @override
  PedidoMoldes? build() {
    return null;
  }

  void selecionarPedido(PedidoMoldes pedido) {
    state = pedido;
  }

  void atualizarStatusPedido(String status) {
    if (state != null) {
      state = state!.copyWith(status: status);
    }
  }
}
