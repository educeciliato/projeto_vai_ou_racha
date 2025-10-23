class Cliente {
  final int id;
  final String nome;
  final String email;
  final String telefone;
  final String cpf;

  Cliente({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.cpf,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
      cpf: json['cpf'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'cpf': cpf,
    };
  }
}
