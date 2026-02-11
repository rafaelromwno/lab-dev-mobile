import 'package:flutter/material.dart';
import '../../application/ServicoController.dart';
import '../../domain/Servico.dart';

class ServicoFormPage extends StatefulWidget {
  final ServicoController controller;
  final Servico? servico;

  const ServicoFormPage({
    super.key,
    required this.controller,
    this.servico,
  });

  @override
  State<ServicoFormPage> createState() => _ServicoFormPageState();
}

class _ServicoFormPageState extends State<ServicoFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.servico != null) {
      _tituloController.text = widget.servico!.titulo;
      _descricaoController.text = widget.servico!.descricao;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.servico != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Editar Serviço" : "Novo Serviço"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: "Título"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Título obrigatório" : null,
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: "Descrição"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Salvar"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (isEdit) {
                      widget.controller.editar(
                        widget.servico!.id,
                        _tituloController.text,
                        _descricaoController.text,
                      );
                    } else {
                      widget.controller.criar(
                        _tituloController.text,
                        _descricaoController.text,
                      );
                    }

                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
