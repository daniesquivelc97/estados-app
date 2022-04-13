import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text('Nombre: ${snapshot.data?.nombre}')
                : Text('Pagina2');
          },
        ),
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
                final nuevoUsuario = Usuario(
                    nombre: 'Daniel',
                    edad: 25,
                    profesiones: ['Ingeniero de sistemas']);
                usuarioService.cargarUsuario(nuevoUsuario);
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
