import 'package:bookly/Features/home/Domain/Entities/book_entity.dart';

abstract class HomeRepo{
Future <List<BookEntity>> fetchFeaturedBooks();
Future <List<BookEntity>> fetchNewestBooks();
}