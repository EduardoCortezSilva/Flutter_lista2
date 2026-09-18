import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Veiculo {
  final String modelo;
  final String marca;

  Veiculo({required this.modelo, required this.marca});
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaVeiculos(),
    );
  }
}

class TelaVeiculos extends StatelessWidget {
  const TelaVeiculos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Veiculo> veiculos = [
      Veiculo(modelo: 'Yaris XLS', marca: 'Toyota'),
      Veiculo(modelo: 'Civic Touring', marca: 'Honda'),
      Veiculo(modelo: 'Corolla Altis', marca: 'Toyota'),
      Veiculo(modelo: 'Golf GTI', marca: 'Volkswagen'),
      Veiculo(modelo: 'Onix Premier', marca: 'Chevrolet'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Veículos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: veiculos.length,
        itemBuilder: (context, index) {
          final veiculo = veiculos[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.directions_car),
              title: Text(
                veiculo.modelo, 
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Marca: ${veiculo.marca}'),
            ),
          );
        },
      ),
    );
  }
}