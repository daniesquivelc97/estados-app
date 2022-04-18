import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
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
                final newUser = Usuario(
                  nombre: 'Daniel',
                  edad: 25,
                  profesiones: [
                    'Ingeniero de sistemas',
                    'Full stack developer'
                  ],
                );
                usuarioCubit.seleccionarUsuario(newUser);
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
                usuarioCubit.cambiarEdad(30);
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
                usuarioCubit.agregarProfesion();
                Navigator.pushNamed(context, 'pagina1');
              },
            ),
          ],
        ),
      ),
    );
  }
}
