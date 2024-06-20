import 'package:front_end/classes/pedido_sistema_camara_quente.dart';
import 'package:front_end/network/requests/pedidos_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pedidos_sistemas_state.g.dart';

@riverpod
class PedidosSistemasState extends _$PedidosSistemasState {
  @override
  Future<List<PedidoSistemaCaramaQuente>> build() async {
    return await PedidosRequest.getPedidosSistemas();
  }

  void atualizarLista(List<PedidoSistemaCaramaQuente> listaPedidos) {
    state = AsyncValue.data(listaPedidos);
  }

  void atualizarPedidos(PedidoSistemaCaramaQuente item) {
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
