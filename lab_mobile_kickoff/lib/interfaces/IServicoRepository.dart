import 'package:lab_mobile_kickoff/domain/Servico.dart';

abstract class IServicoRepository {
  List<Servico> listar();
  void adicionar(Servico servico);
}