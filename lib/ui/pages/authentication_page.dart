import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

// una interfaz muy sencilla en la que podemos crear los tres usuarios (signup)
// y después logearse (login) con cualquiera de las tres

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({Key? key}) : super(key: key);
  final AuthenticationController authenticationController = Get.find();

  void signIn() async {
    // aquí creamos los tres usuarios
    await authenticationController.signup('arturo@gmail.com', '123456');
    await authenticationController.signup('joan@gmail.com', '123456');
    await authenticationController.signup('sergio@gmail.com', '123456');
  }

  void login(String user) {
    // método usado para login
    authenticationController.login(user, '123456');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Chat", 
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.w600 ),),
// colocar icono en el appbar
         actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.supervised_user_circle_rounded),
            onPressed: () {},
          )]),
      body: SafeArea(
        
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    decoration: BoxDecoration(
                        color: Colors.grey.shade50,

                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          
                          onPressed: signIn,
                          child: const Text("Crear los tres usuarios", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600 )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Antes de crear los usuarios, borrar todos los usuarios del sistema de autenticación y la base de datos de tiempo real de firebase', 
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () => login('arturo@gmail.com'),
                                child: const Text("Ingresar con usuario Arturo",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))),
                            ElevatedButton(
                                onPressed: () => login('joan@gmail.com'),
                                child: const Text("Ingresar con usuario joan",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))),
                            ElevatedButton(
                                onPressed: () => login('sergio@gmail.com'),
                                child: const Text("Ingresar con usuario sergio",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600))),
                          ]),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
