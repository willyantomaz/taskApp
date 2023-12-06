import 'dart:html';

import 'package:sqflite/sqflite.dart';
import 'package:teste/componets/task.dart';
import 'package:teste/data/database.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tarefastable('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT,'
      '$_nivel INTEGER )';

  static const String _tarefastable = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  static const String _nivel = 'nivel';

  save(Task tarefa) async {
    final Database bancoDeDados = await getDatabase();
    var itemExist = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExist.isEmpty) {
      return await bancoDeDados.insert(_tarefastable, taskMap);
    } else {
      return await bancoDeDados.update(
        _tarefastable,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    final Map<String, dynamic> mapaDetarefas = Map();
    mapaDetarefas[_name] = tarefa.nome;
    mapaDetarefas[_difficulty] = tarefa.dificuldade;
    mapaDetarefas[_image] = tarefa.foto;
    mapaDetarefas[_nivel] = tarefa.nivel;
    return mapaDetarefas;
  }

  Future<List<Task>> findAll() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tarefastable);
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty], linha[_nivel]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tarefastable, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.delete(
        _tarefastable,
        where: '$_name = ?',
        whereArgs: [nomeDaTarefa],
    );
  }
}
