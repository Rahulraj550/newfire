
import 'package:flutter/material.dart';
import 'package:newfire/provider_state_management/screens/wishlistpage.dart';
import 'package:provider/provider.dart';

import '../provider/movieprovider.dart';
void main(){
  runApp(ChangeNotifierProvider<MovieProvider>(
    create: (BuildContext context) => MovieProvider(),
    child: MaterialApp(
      home: MovieMain(),
    ),
  ));

}
class MovieMain extends StatelessWidget {
  const MovieMain({super.key});

  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<MovieProvider>().moviesWishList;
    var movies = context.watch<MovieProvider>().movies;
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WishListScreen())),
              label: Text(
                  "Wishlist (you have ${wishmovies.length}movies on the list)"),
              icon: const Icon(Icons.favorite_border)),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            final currentMovie = movies[index];
            return Card(
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.time!),
                trailing: IconButton(
                    icon: Icon(Icons.favorite,
                        color: wishmovies.contains(currentMovie)
                            ? Colors.red
                            : Colors.black),
                    onPressed: () {
                      if (!wishmovies.contains(currentMovie)) {
                        context
                            .read<MovieProvider>()
                            .addtoWishList(currentMovie);
                      } else {
                        context
                            .read<MovieProvider>()
                            .removeFromWishList(currentMovie);
                      }
                    }),
              ),
            );
          }))
        ],
      ),
    );
  }
}