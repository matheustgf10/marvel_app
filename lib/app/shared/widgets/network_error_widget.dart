import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/app/modules/home/home_store.dart';

class NetworkErrorWidget extends StatelessWidget {
  HomeStore controller;

  NetworkErrorWidget({controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 45),
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'lib/app/shared/assets/imgs/oops.png',
                  height: 100,
                ),
              ),
              Image.asset(
                'lib/app/shared/assets/imgs/error.png',
                height: 250,
              ),
              SizedBox(
                height: 80,
              ),
              AutoSizeText(
                'Não foi possível carregar os dados! \nVerifique a conexão com a internet',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 150,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.red;
                        return null; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    // ! FALTA IMPLEMENTAR DE MANEIRA CORRETA
                    // ! TALVEZ UTTILIZANDO OUTROS COMO OUTRO MÓDULO
                    controller.getComics(orderBy: 'title');
                  },
                  child: Row(
                    children: [
                      Text(
                        'Recarregar',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.refresh_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
