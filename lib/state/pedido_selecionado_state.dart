import 'package:front_end/classes/pedido.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedido_selecionado_state.g.dart';

@riverpod
class PedidoSelecionadoState extends _$PedidoSelecionadoState {
  @override
  Pedido? build() {
    return null;
  }

  void selecionarPedido(Pedido pedido) {
    state = pedido;
  }
}
