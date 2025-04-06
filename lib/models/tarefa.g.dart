// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefa.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TarefaAdapter extends TypeAdapter<Tarefa> {
  @override
  final int typeId = 0;

  @override
  Tarefa read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tarefa(
      titulo: fields[0] as String,
      concluida: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Tarefa obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.titulo)
      ..writeByte(1)
      ..write(obj.concluida);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TarefaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
