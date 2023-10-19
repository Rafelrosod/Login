import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  String? _erroEmail;
  String? _erroSenha;

  _sucessoLogin() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login'),
        content: const Text('Sucesso'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok')),
        ],
      ),
    );
  }
  _falhaLogin() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login'),
        content: const Text('Inválido'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok')),
        ],
      ),
    );
  }

  bool _validarCampos(String email, String senha) {
    _erroEmail = null;
    _erroSenha = null;
    if (email.isEmpty) {
      _erroEmail = "E-mail é obrigatório";
    }
    if (senha.isEmpty) {
      _erroSenha = "Senha é obrigatório";
    }
    return _erroEmail == null && _erroSenha == null;
  }

  bool _autenticar(String email, String senha) {
    return email == "leo" && senha == "1234";
  }

  _click(){
    String email = _emailController.text;
    String senha = _senhaController.text;
    if (_validarCampos(email, senha)) {
      if (_autenticar(email, senha)) {
        _sucessoLogin();
      } else {
        _falhaLogin();
      }
    }
    setState(() {
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff1f005c),
            Color(0xff5b0060),
            Color(0xff870160),
            Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            Color(0xfff39060),
            Color(0xffffb56b),
          ],
        )),
        child: Center(
          child: Container(
              width: 320,
              height: 600,
              color: const Color.fromRGBO(36, 29, 29, 100),child:Column(
               children: [
               AppBar(title: const Text("Login", style: TextStyle(color: Colors.blue),),
                   centerTitle: true,
                   backgroundColor: Colors.black54,
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                  child: Image.asset('asset/images/web.png', width: 250),
              ),
               ),
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text("Dark Web",style: TextStyle(fontSize: 30)),
                ),
               Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'exemplo@exemplo.com',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)
                     ),
                   ),
                  ),
               ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _senhaController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    hintText: '000000',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)
                    ),
                  ),
                ),
              ),
                  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ElevatedButton(onPressed: _click,
                     style: ElevatedButton.styleFrom(
                       fixedSize: const Size(300, 35)
                     ), child:const Text("Login"),),
              )
              ],
              ),
          ),
          ),
      ),
    );
  }
}
