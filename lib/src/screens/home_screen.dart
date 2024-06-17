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
                      'Controle com eficácia sua produção',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
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
                    child: const Icon(FluentIcons.new_16_regular),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: const Text('Produtos'),
                  subtitle: const Text('Cadastre e atualize produtos'),
                  onTap: () {
                    context.go('/cadastrar_produto');
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
                    child: const Icon(FluentIcons.production_20_regular),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: const Text('Pedidos'),
                  subtitle: const Text('Gerencie e atualize seus pedidos'),
                  onTap: () {
                    context.go('/pedidos');
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
