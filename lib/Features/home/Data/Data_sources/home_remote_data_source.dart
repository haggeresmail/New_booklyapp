import 'package:bookly/Features/home/Data/Models/book_model/book_model.dart';
import 'package:bookly/Features/home/Domain/Entities/book_entity.dart';
import 'package:bookly/core/utils/api_sevice.dart';

abstract class HomeRemoteDataSource{
  Future <List<BookEntity>> fetchFeaturedBooks();
Future <List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
 final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async{
   var data =await  apiService.get(endpoint: 'volumes?Filtering=free-ebooks&q=programming');
   List<BookEntity> books = getListBooks(data);

   return books;
   
  }

  List<BookEntity> getListBooks(Map<String, dynamic> data) {
    List<BookEntity> books=[];
    for (var bookMap in data['items']) {
     books.add(BookModel.fromJson(bookMap));
      
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}