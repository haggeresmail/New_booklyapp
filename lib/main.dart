import 'package:bookly/Features/home/Data/Data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/Data/Data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/Data/repos/home_repos_impl.dart';
import 'package:bookly/Features/home/Domain/Entities/book_entity.dart';
import 'package:bookly/Features/home/Domain/use_cases/fetch_featured_books_usecase.dart';
import 'package:bookly/Features/home/Domain/use_cases/fetch_newest_book_usecase.dart';
import 'package:bookly/Features/home/presentation/manger/featuredbooks_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/newsetbooks_cubit/newest_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_sevice.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/functions/setuo%20service_locator.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setUpServiceLocator();

  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewsetBox);
  Bloc.observer=SimpleBlocObserver();
  runApp(const Bookly());
}


class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..fetchFeaturedBooks();
          },
        ),
        BlocProvider(create: (context) {
          return NewestBooksCubit(
              FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()));

        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
