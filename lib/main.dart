import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lista_tarefas/tarefas_page.dart';
import 'package:provider/provider.dart';
import 'models/tarefa.dart';
import 'providers/tarefa_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TarefaAdapter());
  await Hive.openBox<Tarefa>('tarefas');

  runApp(
    ChangeNotifierProvider(
      create: (_) => TarefaProvider()..carregarTarefas(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas com Provider',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TarefasPage(),
    );
  }
}
