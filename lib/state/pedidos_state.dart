import 'package:front_end/classes/pedido.dart';
import 'package:front_end/network/requests/pedidos_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedidos_state.g.dart';

@riverpod
class PedidosState extends _$PedidosState {
  @override
  Future<List<Pedido>> build() async {
    return await PedidosRequest.getItem();
  }

  void atualizarLista(List<Pedido> listaPedidos) {
    state = AsyncValue.data(listaPedidos);
  }

  void atualizarPedidos(Pedido item) {
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
