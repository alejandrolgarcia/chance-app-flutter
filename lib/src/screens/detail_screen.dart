
import 'package:chance_app/src/providers/service_provider.dart';
import 'package:chance_app/src/widgets/card_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:chance_app/src/models/cards_model.dart';

class CardDetail extends StatelessWidget {

  final _serviceProvider = ServiceProvider();

  @override
  Widget build(BuildContext context) {

    final Cards tarjeta = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerIsScroolled) {
            return <Widget> [
              _sliverAppBar(tarjeta),
            ];
          },            
          body: _cardService(tarjeta)
        )
      ),
    );
  }

  Widget _cardService( Cards tarjeta) {
    return Container(
      height: 660.0,
      child: FutureBuilder(
        future: _serviceProvider.getServiceByUser(tarjeta.user.id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.done:
              return Container(
                child: ListView(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 20
                  ),
                  children: snapshot.data.map<Widget>( (result) {
                    return Container(
                      child: CardServiceWidget(serviceCard: result),
                    );
                  }).toList(),
                ),
              );
              break;
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  SliverAppBar _sliverAppBar(Cards tarjeta) {
    return SliverAppBar(
      backgroundColor: Colors.deepPurple,
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          '${tarjeta.user.firstname} ${tarjeta.user.lastname}',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: Hero(
          tag: tarjeta.id,
          child: FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'),
            image: NetworkImage(tarjeta.getImg()),
            fadeInDuration: Duration(milliseconds: 150),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}


