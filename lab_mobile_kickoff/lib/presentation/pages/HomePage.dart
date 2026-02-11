import 'package:lab_mobile_kickoff/domain/Servico.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Servico servico;

  const HomePage({super.key, required this.servico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Serviço")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              servico.titulo,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(servico.descricao),
          ],
        ),
      ),
    );
  }
}