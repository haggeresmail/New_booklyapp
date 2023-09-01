import 'package:bookly/Features/home/Data/Data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/Data/Data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/Domain/Entities/book_entity.dart';
import 'package:bookly/Features/home/Domain/repo/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});


  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks()async {
    try {
      var bookList=homeLocalDataSource.fetchFeaturedBooks();
      if(bookList.isNotEmpty){
        return right(bookList);
      }
  var books=await  homeRemoteDataSource.fetchFeaturedBooks();
  return right(books);
} catch (e) {
  return left(Failure());
  // TODO
}
   
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}