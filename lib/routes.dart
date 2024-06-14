import 'package:front_end/src/screens/cadastrar_produto_screen.dart';
import 'package:front_end/src/screens/home_screen.dart';
import 'package:front_end/src/screens/pedidos_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static GoRouter getRoutes() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(title: ''),
          routes: [
            GoRoute(
              path: 'cadastrar_produto',
              builder: (context, state) => const CadastrarProdutoScreen(),
            ),
            GoRoute(
              path: 'pedidos',
              builder: (context, state) => const PedidosScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
