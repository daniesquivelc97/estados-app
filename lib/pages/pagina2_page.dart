import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text('Nombre: ${usuarioService.usuario?.nombre}')
            : const Text('Página 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: const Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                usuarioService.usuario =
                    Usuario(nombre: 'Daniel', edad: 25, profesiones: [
                  'Ingeniero de sistemas',
                  'Full Stack Developer',
                  'Gaming',
                ]);
                Navigator.pushNamed(context, 'pagina1');
              },
            ),
            MaterialButton(
              child: const Text(
                'Camdiar edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                usuarioService.cambiarEdad(30);
                Navigator.pushNamed(context, 'pagina1');
              },
            ),
            MaterialButton(
              child: const Text(
                'Añadir profesión',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                usuarioService.agregarProfesion();
                Navigator.pushNamed(context, 'pagina1');
              },
            ),
          ],
        ),
      ),
    );
  }
}
