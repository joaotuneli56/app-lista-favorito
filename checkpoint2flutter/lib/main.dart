import 'package:checkpoint2/contato.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ListaPage(),
    );
  }
}

class ListaPage extends StatefulWidget {
  ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  int contador = 0;

  List<Contato> contatos = [
    Contato('João Silva', 'joaosilva@email.com'),
    Contato('Ana Santos', 'ana.santos@email.com'),
    Contato('Carlos Oliveira', 'oliveiracarlos@email.com'),
    Contato('Maria Costa', 'maria.costa@email.com'),
    Contato('Pedro Pereira', 'pedropereira@email.com'),
    Contato('Sofia Rodrigues', 'rodriguessofia@email.com'),
    Contato('Tiago Fernandes', 'tiago.fernandes@email.com'),
    Contato('Inês Almeida', 'ines.almeida@email.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Contatos Favoritos $contador',
          style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(contatos[index].nome[0]),
            ),
            title: Text(contatos[index].nome),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
              icon: contatos[index].favoritado
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_border),
              onPressed: () {
                setState(() {
                  contatos[index].favoritado = !contatos[index].favoritado;
                  contador = contatos.where((contato) => contato.favoritado).length;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
