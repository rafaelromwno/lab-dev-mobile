import 'package:lab_mobile_kickoff/interfaces/IServicoRepository.dart';
import 'package:lab_mobile_kickoff/domain/Servico.dart';

class ServicoRepositoryFake implements IServicoRepository {
  final List<Servico> _servicos = [];

  @override
  List<Servico> listar() {
    return _servicos;
  }

  @override
  void adicionar(Servico servico) {
    _servicos.add(servico);
  }
}