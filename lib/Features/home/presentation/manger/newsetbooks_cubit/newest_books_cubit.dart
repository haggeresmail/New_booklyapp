import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/Domain/Entities/book_entity.dart';
import 'package:bookly/Features/home/Domain/use_cases/fetch_newest_book_usecase.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newsetBooksUseCase) : super(NewestBooksInitial());

 final FetchNewestBooksUseCase newsetBooksUseCase;
 
  Future<void> fetchNewestBooks()async{
    emit( NewestBooksLoading());
     var result = await newsetBooksUseCase.call();
     result.fold((failure) {
emit( NewestBooksFailure(failure.message));
     }, (books) {
      emit( NewestBooksSuccess(books));

     });
  }

}
