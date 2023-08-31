import 'package:bookly/Features/home/Domain/Entities/book_entity.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
Future <Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
Future <Either<Failure, List<BookEntity>>> fetchNewestBooks();
}