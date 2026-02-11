import '../domain/Servico.dart';
import '../domain/repository/ServicoRepository.dart';

class ServicoController {
  final ServicoRepository repository;

  List<Servico> servicos = [];

  ServicoController(this.repository);

  void carregar() {
    servicos = repository.getAll();
  }

  void criar(String titulo, String descricao) {
    final novo = Servico(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      titulo: titulo,
      descricao: descricao,
    );

    repository.add(novo);
    carregar();
  }

  void editar(String id, String titulo, String descricao) {
    final atualizado = Servico(
      id: id,
      titulo: titulo,
      descricao: descricao,
    );

    repository.update(atualizado);
    carregar();
  }

  void remover(String id) {
    repository.delete(id);
    carregar();
  }
}