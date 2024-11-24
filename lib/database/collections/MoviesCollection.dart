
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../api/model/Movie.dart';

class MoviesCollection
{
  CollectionReference<Movie> getMoviesCollection(){
    var db = FirebaseFirestore.instance;

    return db.collection('movies')
        .withConverter(
        fromFirestore: (snapshot,options){return Movie.fromFirestore(snapshot.data());},
        toFirestore: (object,options){return object.toFirestore();});
  }
  void addMovies(Movie? movie){

    if(movie!=null)
    {
      getMoviesCollection().doc('${movie.id}').set(movie);
      print('Movie is added in watch list');
    }else{print('No such a movie !');}

  }

   getMovies() async {
   QuerySnapshot<Movie> querySnap =await getMoviesCollection().get();
   var moviesList=querySnap.docs.map((docSnapshot)=> docSnapshot.data()).toList();
   return moviesList;
  }

  void deleteMovie(String movieId){

      getMoviesCollection().doc(movieId).delete();
      print('Movie is deleted from watch list');

  }

  Future<bool> isMovieInWatchlist( String movieId) async {
    DocumentSnapshot doc = await getMoviesCollection()
        .doc(movieId)
        .get();

    return doc.exists;
  }
}