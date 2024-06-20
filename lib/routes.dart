import 'package:front_end/src/screens/componentes/componentes_screen.dart';
import 'package:front_end/src/screens/materiais/materiais_screen.dart';
import 'package:front_end/src/screens/pedidos_ferramenta/detalhes_ferramenta_screen.dart';
import 'package:front_end/src/screens/pedidos_ferramenta/pedido_ferramenta_selecionado_screen.dart';
import 'package:front_end/src/screens/pedidos_molde/detalhes_molde_screen.dart';
import 'package:front_end/src/screens/home_screen.dart';
import 'package:front_end/src/screens/pedidos_molde/pedido_molde_selecionado_screen.dart';
import 'package:front_end/src/screens/pedidos_ferramenta/pedidos_ferramentas_screen.dart';
import 'package:front_end/src/screens/pedidos_molde/pedidos_moldes_screen.dart';
import 'package:front_end/src/screens/pedidos_sistema/detalhes_sistema_screen.dart';
import 'package:front_end/src/screens/pedidos_sistema/pedido_sistema_selecionado_screen.dart';
import 'package:front_end/src/screens/pedidos_sistema/pedidos_sistemas_screen.dart';
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
              path: 'materiais',
              builder: (context, state) => const MateriaisScreen(),
            ),
            GoRoute(
              path: 'componentes',
              builder: (context, state) => const ComponentesScreen(),
            ),
            GoRoute(
                path: 'pedidos_moldes',
                builder: (context, state) => const PedidosMoldesScreen(),
                routes: [
                  GoRoute(
                      path: 'pedido_molde_selecionado',
                      builder: (context, state) =>
                          const PedidoMoldeSelecionadoScreen(),
                      routes: [
                        GoRoute(
                          path: 'detalhes_molde',
                          builder: (context, state) =>
                              const DetalhesMoldeScreen(),
                        )
                      ])
                ]),
            GoRoute(
                path: 'pedidos_ferramentas',
                builder: (context, state) => const PedidosFerramentasScreen(),
                routes: [
                  GoRoute(
                      path: 'pedido_ferramenta_selecionado',
                      builder: (context, state) =>
                          const PedidoFerramentaSelecionadoScreen(),
                      routes: [
                        GoRoute(
                          path: 'detalhes_ferramenta',
                          builder: (context, state) =>
                              const DetalhesFerramentaScreen(),
                        )
                      ])
                ]),
            GoRoute(
                path: 'pedidos_sistemas',
                builder: (context, state) => const PedidosSistemasScreen(),
                routes: [
                  GoRoute(
                      path: 'pedido_sistema_selecionado',
                      builder: (context, state) =>
                          const PedidoSistemaSelecionadoScreen(),
                      routes: [
                        GoRoute(
                          path: 'detalhes_sistema',
                          builder: (context, state) =>
                              const DetalhesSistemaScreen(),
                        )
                      ])
                ]),
          ],
        ),
      ],
    );
  }
}
