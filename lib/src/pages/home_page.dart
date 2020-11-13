import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pelicula/src/providers/peliculas_provider.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pelicula/src/widgets/card_swiper_widget.dart';


class HomePage extends StatelessWidget {

final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.search ),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context)
          ],
          ),
      )
      
    );
  }


  Widget _swiperTarjetas() {
    
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
    
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

        if(snapshot.hasData){
          return CardSwiper(peliculas: snapshot.data);
        }else{
       return Container(
         child: Center(
           child: CircularProgressIndicator()));
    
    }
      },
    );
    
    
        //peliculasProvider.getEnCines();

    //return CardSwiper(
    //  peliculas: [1,2,3,4,5],
   // );
 } 


Widget _footer(BuildContext context){
  return Container(
    width: double.infinity,
    child : Column(
      children:<Widget>[
        Text('Populares' , style: Theme.of(context).textTheme.subhead,),

              FutureBuilder(
                future: peliculasProvider.getPopulares(),
                builder: (BuildContext context , AsyncSnapshot<List>snapshop ){

                  snapshop.data?.forEach((p) => print(p.title));
                  return Container();

                }

              ),
      ],
    ),
  );
}

}