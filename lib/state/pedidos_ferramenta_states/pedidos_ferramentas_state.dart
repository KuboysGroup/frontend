import 'package:front_end/classes/pedido_ferramentas.dart';
import 'package:front_end/network/requests/pedidos_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedidos_ferramentas_state.g.dart';

@riverpod
class PedidosFerramentasState extends _$PedidosFerramentasState {
  @override
  Future<List<PedidoFerramentas>> build() async {
    return await PedidosRequest.getPedidosFerramentas();
  }

  void atualizarLista(List<PedidoFerramentas> listaPedidos) {
    state = AsyncValue.data(listaPedidos);
  }

  void atualizarPedidos(PedidoFerramentas item) {
    state.whenData((pedidos) {
      final updatedPedidos = pedidos.map((element) {
        if (element.id == item.id) {
          return element.copyWith(status: item.status);
        } else {
          return element;
        }
      }).toList();
      state = AsyncValue.data(updatedPedidos);
    });
  }
}
