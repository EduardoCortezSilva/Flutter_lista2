import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaJogosFavoritos(),
    );
  }
}

class TelaJogosFavoritos extends StatefulWidget {
  const TelaJogosFavoritos({super.key});

  @override
  State<TelaJogosFavoritos> createState() => _TelaJogosFavoritosState();
}

class _TelaJogosFavoritosState extends State<TelaJogosFavoritos> {
  final TextEditingController jogoController = TextEditingController();
  final List<String> jogos = [];

  void adicionarJogo() {
    final String texto = jogoController.text.trim();
    if (texto.isEmpty) return;

    setState(() {
      jogos.add(texto);
    });
    jogoController.clear();
  }

  void removerJogo(int index) {
    setState(() {
      jogos.removeAt(index);
    });
  }

  @override
  void dispose() {
    jogoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Jogos Favoritos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: jogoController,
              decoration: const InputDecoration(
                labelText: 'Nome do jogo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: adicionarJogo,
              child: const Text('Adicionar Jogo'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: jogos.isEmpty
                  ? const Center(
                      child: Text('Nenhum jogo adicionado à lista.'),
                    )
                  : ListView.builder(
                      itemCount: jogos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.sports_esports),
                            title: Text(jogos[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => removerJogo(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}