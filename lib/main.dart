import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transferência de dinheiro',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Transferencia(),
    );
  }
}

class Transferencia extends StatefulWidget {
  const Transferencia({Key? key}) : super(key: key);

  _TransferenciaState createState() => _TransferenciaState();
}

class _TransferenciaState extends State<Transferencia> {
  final TextEditingController _pessoaTextController = TextEditingController();
  final TextEditingController _dinheiroTextController = TextEditingController();

  List<String> _itens = [];

  void _addItem() {
    double? valor = double.tryParse(_dinheiroTextController.text);
    if (valor != null) {
      if (valor > 0) {
        setState(() {
          _itens.add("Transferiu $valor barão pro caboco " +
              _pessoaTextController.text);
          _dinheiroTextController.clear();
          _pessoaTextController.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transferência de dinheiro',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _pessoaTextController,
              decoration: InputDecoration(
                labelText: 'Digita o nome do Peão que vai receber',
              ),
            ),
            TextField(
              controller: _dinheiroTextController,
              decoration: InputDecoration(
                labelText: 'Digita quantos barão quer transferir',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Transferir'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                itemCount: _itens.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_itens[index]),
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
