import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/tarefa.dart';

class TarefaProvider with ChangeNotifier {
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  Future<void> carregarTarefas() async {
    final box = await Hive.openBox<Tarefa>('tarefas');
    _tarefas = box.values.toList();
    notifyListeners();
  }

  Future<void> adicionarTarefa(String titulo) async {
    final box = Hive.box<Tarefa>('tarefas');
    final tarefa = Tarefa(titulo: titulo);
    await box.add(tarefa);
    _tarefas = box.values.toList();
    notifyListeners();
  }

  Future<void> alternarConclusao(Tarefa tarefa) async {
    tarefa.concluida = !tarefa.concluida;
    await tarefa.save();
    notifyListeners();
  }

  Future<void> removerTarefa(Tarefa tarefa) async {
    await tarefa.delete();
    _tarefas.remove(tarefa);
    notifyListeners();
  }
}
