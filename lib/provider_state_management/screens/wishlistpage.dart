

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/movieprovider.dart';

class WishListScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<MovieProvider>().moviesWishList;
    return Scaffold(
      body: ListView.builder(itemCount: wishmovies.length ,
          itemBuilder: (context, index){
            final wishMovie = wishmovies[index];
            return Card(
              child: ListTile(
                title:Text(wishMovie.title),
                subtitle: Text(wishMovie.time!),
                trailing: TextButton(onPressed: (){
                  context.read<MovieProvider>().removeFromWishList(wishMovie);
                }, child: const Text("remove")),
              ),
            );
          }),
    );
  }
}