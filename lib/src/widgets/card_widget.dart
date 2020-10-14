import 'package:chance_app/src/models/cards_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {

  final List<Cards> tarjetas;

  CardWidget({ @required this.tarjetas});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: _cards(context),
      ),
    );
  }

  List<Widget> _cards (BuildContext context) {
    return tarjetas.map( ( tarjeta ) {
      return Card(
        elevation: 5.0,
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tarjeta.profession,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ButtonBar(
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border_outlined),
                        onPressed: (){},
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: (){},
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: (){},
                      )
                    ]
                  )
                ]
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'detail', arguments: tarjeta),
                child: Row(
                  children: [
                    Hero(
                      tag: tarjeta.id,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(tarjeta.getImg()),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${tarjeta.user.firstname} ${tarjeta.user.lastname}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(tarjeta.phone),
                          Text(tarjeta.email),
                          Text(tarjeta.address),
                          Text(tarjeta.website),
                          SizedBox(height: 5),
                          Text(tarjeta.slogan)
                        ],
                      )
                    )
                  ],
                ),
              )
            ]
          )
        )
      );
    }).toList();
  }

}