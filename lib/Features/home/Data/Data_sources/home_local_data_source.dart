
import 'package:bookly/Features/home/Domain/Entities/book_entity.dart';
import 'package:bookly/core/utils/api_sevice.dart';

abstract class HomeLocalDataSource{
 List<BookEntity> fetchFeaturedBooks();
List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource{
 final ApiService apiService;

  HomeLocalDataSourceImpl(this.apiService);
  
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
  
  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

}
