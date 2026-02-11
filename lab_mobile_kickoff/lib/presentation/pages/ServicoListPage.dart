import 'package:flutter/material.dart';
import '../../application/ServicoController.dart';
import 'ServicoFormPage.dart';

class ServicoListPage extends StatefulWidget {
  final ServicoController controller;

  const ServicoListPage({super.key, required this.controller});

  @override
  State<ServicoListPage> createState() => _ServicoListPageState();
}

class _ServicoListPageState extends State<ServicoListPage> {

  @override
  void initState() {
    super.initState();
    widget.controller.carregar();
  }

  @override
  Widget build(BuildContext context) {
    final servicos = widget.controller.servicos;

    return Scaffold(
      appBar: AppBar(title: const Text("Laboratório Mobile")),
      body: ListView.builder(
        itemCount: servicos.length,
        itemBuilder: (context, index) {
          final s = servicos[index];

          return ListTile(
            title: Text(s.titulo),
            subtitle: Text(s.descricao),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ServicoFormPage(
                          controller: widget.controller,
                          servico: s,
                        ),
                      ),
                    );
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    widget.controller.remover(s.id);
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Serviço removido")),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ServicoFormPage(
                controller: widget.controller,
              ),
            ),
          );
          setState(() {});
        },
      ),
    );
  }
}
