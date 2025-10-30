import 'package:flutter/material.dart';
import 'package:flutter_vai_ou_racha/data/data_cliente.dart';
import 'package:flutter_vai_ou_racha/model/cliente.dart';

class CadastroClienteTela extends StatefulWidget {
  final Cliente? cliente;

  CadastroClienteTela({this.cliente});

  @override
  State<CadastroClienteTela> createState() => _CadastroClienteTelaState();
}

class _CadastroClienteTelaState extends State<CadastroClienteTela> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();
  final cpfController = TextEditingController();
  final enderecoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.cliente != null) {
      nomeController.text = widget.cliente!.nome;
      emailController.text = widget.cliente!.email;
      telefoneController.text = widget.cliente!.telefone;
      cpfController.text = widget.cliente!.cpf;
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    cpfController.dispose();
    super.dispose();
  }

  void salvar() {
    if (_formKey.currentState!.validate()) {
      int id;
      if (widget.cliente != null) {
        id = widget.cliente!.id;
      } else {
        id = data_cliente.isEmpty
            ? 1
            : data_cliente.keys.reduce((a, b) => a > b ? a : b) + 1;
      }

      Cliente cliente = Cliente(
        id: id,
        nome: nomeController.text,
        email: emailController.text,
        telefone: telefoneController.text,
        cpf: cpfController.text,
      );

      Navigator.pop(context, cliente);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.cliente == null ? 'Adicionar Cliente' : 'Editar Cliente',
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Digite o nome';
                  }
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Digite o E-mail!';
                  } else if (!val.contains('@') || !val.contains('.com')) {
                    return 'E-mail Inválido!';
                  }
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: telefoneController,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'digite o telelforne!';
                  } else if (val!.length < 10) {
                    return 'Telefone Inválido!';
                  }
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: cpfController,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Digite o cpf!';
                  } else if (val!.length < 11) {
                    return 'CPF Inválido!';
                  }
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: enderecoController,
                decoration: InputDecoration(
                  labelText: 'Endereço',
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Digite o cpf';
                  } else if (val!.length < 10) {
                    return 'Endereço Inválido!';
                  }
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                    ),
                    child: Text('Cancelar', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: salvar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                    ),
                    child: Text('Salvar', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
