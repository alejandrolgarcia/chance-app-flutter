
import 'package:chance_app/src/providers/card_provider.dart';
import 'package:chance_app/src/widgets/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final _cardProvider = CardProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: false,
        title: Text(
          'Chance App',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.message,
            ), 
            onPressed: (){}
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: _card(),
      ),
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