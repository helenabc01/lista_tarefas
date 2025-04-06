import 'package:hive/hive.dart';

part 'tarefa.g.dart';

@HiveType(typeId: 0)
class Tarefa extends HiveObject {
  @HiveField(0)
  String titulo;

  @HiveField(1)
  bool concluida;

  Tarefa({required this.titulo, this.concluida = false});
}
