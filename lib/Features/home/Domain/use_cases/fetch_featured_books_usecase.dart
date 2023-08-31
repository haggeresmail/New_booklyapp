import 'package:bookly/Features/home/Domain/Entities/book_entity.dart';
import 'package:bookly/Features/home/Domain/repo/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase{
final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);
  Future <Either<Failure, List<BookEntity>>> fetchFeaturedBooks(){
    return homeRepo.fetchFeaturedBooks();
    
  }


}