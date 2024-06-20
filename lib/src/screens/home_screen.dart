import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gestop',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      'Gestão Estratégica de Sistemas Típicamente Operacionais',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Icon(FluentIcons.mold_20_regular),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: const Text('Pedidos de Moldes'),
                  subtitle: const Text('Gerencie e atualize seus pedidos'),
                  onTap: () {
                    context.go('/pedidos_moldes');
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Icon(FluentIcons.toolbox_20_regular),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: const Text('Pedidos de Ferramentas'),
                  subtitle: const Text('Gerencie e atualize seus pedidos'),
                  onTap: () {
                    context.go('/pedidos_ferramentas');
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Icon(FluentIcons.fireplace_20_regular),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: const Text('Pedidos de Sistema de Câmara Quente'),
                  subtitle: const Text('Gerencie e atualize seus pedidos'),
                  onTap: () {
                    context.go('/pedidos_sistemas');
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Icon(FluentIcons.feed_20_regular),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: const Text('Materiais'),
                  subtitle: const Text('Consulte e atualize os materiais'),
                  onTap: () {
                    context.go('/materiais');
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Icon(FluentIcons.puzzle_cube_20_regular),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: const Text('Componentes'),
                  subtitle: const Text('Consulte e atualize os materiais'),
                  onTap: () {
                    context.go('/componentes');
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
