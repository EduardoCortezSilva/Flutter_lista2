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
      home: TelaJogos(),
    );
  }
}

class TelaJogos extends StatelessWidget {
  const TelaJogos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> jogos = [
      'Grand Theft Auto V',
      'Minecraft',
      'Rainbow Six Siege',
      'SnowRunner',
      'WorldBox',
      'Counter-Strike 2',
      'Valorant',
      'League of Legends',
      'The Witcher 3',
      'Red Dead Redemption 2',
      'Elden Ring',
      'Cyberpunk 2077',
      'Rocket League',
      'Forza Horizon 5',
      'EA Sports FC 24',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Jogos'),
      ),
      body: ListView.builder(
        itemCount: jogos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.sports_esports),
            title: Text(jogos[index]),
          );
        },
      ),
    );
  }
}