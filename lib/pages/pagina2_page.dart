import 'package:estados_app/bloc/user/user_bloc.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
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
                final user = Usuario(
                  nombre: 'Daniel',
                  edad: 25,
                  profesiones: ['Ingeniero de sistemas', 'Full Stack Dev'],
                );
                userBloc.add(ActivateUser(user));
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
                userBloc.add(ChangeUserAge(30));
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
                userBloc.add(AddProfession('Nueva profesión'));
                Navigator.pushNamed(context, 'pagina1');
              },
            ),
          ],
        ),
      ),
    );
  }
}
