import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/modules/home/home_store.dart';
import 'package:marvel_app/app/utils/constants.dart';

class OrderByDropdownWidget extends StatefulWidget {
  @override
  _OrderByDropdownWidgetState createState() => _OrderByDropdownWidgetState();
}

class _OrderByDropdownWidgetState
    extends ModularState<OrderByDropdownWidget, HomeStore> {
  String defaultValue = 'Título';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: AutoSizeText(
              'Ordenar Por',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Container(
            child: DropdownButton<String>(
              dropdownColor: BACKGROUND_DARK_COLOR,
              value: defaultValue,
              icon: const Icon(
                Icons.arrow_downward,
                color: Colors.red,
              ),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  backgroundColor: BACKGROUND_DARK_COLOR),
              underline: Container(height: 2, color: Colors.red),
              onChanged: (String newValue) {
                setState(() {
                  defaultValue = newValue;
                  controller.isPressedDropdownOrderBy = true;
                  controller.isReloadedComics = false;
                  switch (defaultValue) {
                    case 'Título':
                      controller.getComicsOrderBy('title');
                      break;
                    case 'Última vez Modificado':
                      controller.getComicsOrderBy('modified');
                      break;
                    case 'Data de Venda':
                      controller.getComicsOrderBy('onsaleDate');
                      break;
                    default:
                      print('Error ocurred in OrderByWidget.dart');
                  }
                });
              },
              items: <String>[
                'Título',
                'Data de Venda',
                'Última vez Modificado'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
