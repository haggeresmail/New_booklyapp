import 'package:bookly/Features/home/Domain/Entities/book_entity.dart';
import 'package:bookly/Features/home/Domain/repo/home_repo.dart';
import 'package:bookly/Features/home/Domain/use_cases/use_case.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,NoParam>{
final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);
  
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param])async {
    // TODO: implement call
      return await homeRepo.fetchFeaturedBooks();
  }
  
  
}
