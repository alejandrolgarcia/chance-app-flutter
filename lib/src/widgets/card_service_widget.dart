import 'package:chance_app/src/models/service_model.dart';
import 'package:flutter/material.dart';

class CardServiceWidget extends StatelessWidget {
  
  final Service serviceCard;

  CardServiceWidget({ @required this.serviceCard });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3)
          )
        ]
      ),
      
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            ),
            child: FadeInImage(
              image: NetworkImage(serviceCard.getImg()),
              placeholder: AssetImage('assets/images/jar-loading.gif'),
              height: 300.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceCard.name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  serviceCard.desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Precio: ${serviceCard.price}'),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star_half),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 5),
                Text('Horario de atencion: ${serviceCard.time}'),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customBottom('ENVIAR MENSAJE', Colors.grey),
                    customBottom('COTIZAR', Colors.deepPurple)
                  ],
                )
              ]
            ),
          )
        ]
      ),
    );
  }

  Container customBottom(String text, Color color) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}