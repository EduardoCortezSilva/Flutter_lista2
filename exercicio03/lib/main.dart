import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Aluno {
  final String nome;
  final double nota;

  Aluno({required this.nome, required this.nota});
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaAlunos(),
    );
  }
}

class TelaAlunos extends StatelessWidget {
  const TelaAlunos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Aluno> alunos = [
      Aluno(nome: 'Eduardo Cortez', nota: 8.5),
      Aluno(nome: 'Ana livia', nota: 9.0),
      Aluno(nome: 'Pedro Marques', nota: 5.5),
      Aluno(nome: 'Matheus Fazolli', nota: 7.0),
      Aluno(nome: 'Lucas Pecca', nota: 6.2),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Alunos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          final aluno = alunos[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                aluno.nome, 
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Nota: ${aluno.nota.toStringAsFixed(1)}'),
            ),
          );
        },
      ),
    );
  }
}