import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/tarefa.dart';
import 'providers/tarefa_provider.dart';

class TarefasPage extends StatelessWidget {
  final _controller = TextEditingController();

  void _mostrarDialogoAdicionar(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Nova Tarefa'),
            content: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Digite o título'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _controller.clear();
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  final texto = _controller.text.trim();
                  if (texto.isNotEmpty) {
                    Provider.of<TarefaProvider>(
                      context,
                      listen: false,
                    ).adicionarTarefa(texto);
                  }
                  _controller.clear();
                  Navigator.pop(context);
                },
                child: Text('Adicionar'),
              ),
            ],
          ),
    );
  }

  void _removerTarefa(BuildContext context, Tarefa tarefa) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Remover Tarefa'),
            content: Text('Deseja realmente remover essa tarefa?'),
            actions: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: Text('Remover'),
                onPressed: () {
                  Provider.of<TarefaProvider>(
                    context,
                    listen: false,
                  ).removerTarefa(tarefa);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tarefas = context.watch<TarefaProvider>().tarefas;

    return Scaffold(
      appBar: AppBar(title: Text('Minhas Tarefas')),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (_, index) {
          final tarefa = tarefas[index];
          return ListTile(
            title: Text(
              tarefa.titulo,
              style: TextStyle(
                decoration:
                    tarefa.concluida
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            ),
            leading: Checkbox(
              value: tarefa.concluida,
              onChanged:
                  (_) =>
                      context.read<TarefaProvider>().alternarConclusao(tarefa),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removerTarefa(context, tarefa),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarDialogoAdicionar(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
