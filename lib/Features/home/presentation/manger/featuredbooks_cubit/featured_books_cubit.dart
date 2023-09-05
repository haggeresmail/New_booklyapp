import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/Domain/Entities/book_entity.dart';
import 'package:bookly/Features/home/Domain/use_cases/fetch_featured_books_usecase.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks()async{
    emit(FeaturedBooksLoading());
     var result = await featuredBooksUseCase.call();
     result.fold((failure) {
emit(FeaturedBooksFailure(failure.message));
     }, (books) {
      emit(FeaturedBooksSuccess(books));

     });
  }
}
