// import 'package:chance_app/src/models/cards_model.dart';
// import 'package:chance_app/src/models/cards_model.dart';
import 'package:chance_app/src/providers/card_provider.dart';
import 'package:chance_app/src/widgets/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  final _cardProvider = CardProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _card(),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[200],
        elevation: 10.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Cards'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Perfil'
          ),

        ]
      ) ,
    );
  }

  Widget _card() {
    return Container(
      child: FutureBuilder(
        future: _cardProvider.getCards(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return CardWidget( tarjetas: snapshot.data );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }


}