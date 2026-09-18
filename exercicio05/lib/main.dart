import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Periferico {
  final String nome;
  final double preco;
  final int quantidade;

  Periferico({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaPerifericos(),
    );
  }
}

class TelaPerifericos extends StatefulWidget {
  const TelaPerifericos({super.key});

  @override
  State<TelaPerifericos> createState() => _TelaPerifericosState();
}

class _TelaPerifericosState extends State<TelaPerifericos> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController qtdController = TextEditingController();

  final List<Periferico> listaPerifericos = [];

  void cadastrarPeriferico() {
    final String nome = nomeController.text.trim();
    final double preco = double.tryParse(precoController.text) ?? 0;
    final int qtd = int.tryParse(qtdController.text) ?? 0;

    if (nome.isEmpty || preco <= 0 || qtd <= 0) return;

    setState(() {
      listaPerifericos.add(
        Periferico(nome: nome, preco: preco, quantidade: qtd),
      );
    });

    nomeController.clear();
    precoController.clear();
    qtdController.clear();
  }

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    qtdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Periféricos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do item (ex: Teclado, Mouse)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: qtdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade em estoque',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: cadastrarPeriferico,
              child: const Text('Cadastrar Item'),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: listaPerifericos.isEmpty
                  ? const Center(
                      child: Text('Nenhum periférico cadastrado.'),
                    )
                  : ListView.builder(
                      itemCount: listaPerifericos.length,
                      itemBuilder: (context, index) {
                        final item = listaPerifericos[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.keyboard),
                            title: Text(
                              item.nome,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'R\$ ${item.preco.toStringAsFixed(2)} | Estoque: ${item.quantidade}',
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