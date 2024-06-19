import 'package:front_end/classes/pedido_moldes.dart';
import 'package:front_end/network/requests/pedidos_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedidos_moldes_state.g.dart';

@riverpod
class PedidosMoldesState extends _$PedidosMoldesState {
  @override
  Future<List<PedidoMoldes>> build() async {
    return await PedidosRequest.getPedidosMoldes();
  }

  void atualizarLista(List<PedidoMoldes> listaPedidos) {
    state = AsyncValue.data(listaPedidos);
  }

  void atualizarPedidos(PedidoMoldes item) {
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
