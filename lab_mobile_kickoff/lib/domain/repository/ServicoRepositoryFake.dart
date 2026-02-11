import 'package:lab_mobile_kickoff/domain/repository/ServicoRepository.dart';
import 'package:lab_mobile_kickoff/domain/Servico.dart';

class ServicoRepositoryFake implements ServicoRepository {
  final List<Servico> _servicos = [
    Servico(
      id: '1',
      titulo: 'Design Gráfico',
      descricao: 'Criação de logotipos',
    ),
    Servico(
      id: '2',
      titulo: 'Desenvolvimento Flutter',
      descricao: 'Criação de aplicativos mobile',
    ),
  ];

  @override
  List<Servico> getAll() {
    return List.from(_servicos);
  }

  @override
  void add(Servico s) {
    _servicos.add(s);
  }

  @override
  void update(Servico s) {
    final index = _servicos.indexWhere((e) => e.id == s.id);
    if (index != -1) {
      _servicos[index] = s;
    }
  }

  @override
  void delete(String id) {
    _servicos.removeWhere((e) => e.id == id);
  }
}