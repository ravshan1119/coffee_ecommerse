import 'package:coffee_ecommerse/data/model/coffee_model.dart';
import 'package:coffee_ecommerse/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coffee_add_state.dart';

class CoffeeAddCubit extends Cubit<CoffeeAddState> {

  CoffeeAddCubit() : super(CoffeeAddState.initial());

  // Future<void> getMovies() async {
  //   if (state.movies.isNotEmpty) {
  //     emit(state.copyWith());
  //     return;
  //   }
  //   emit(state.copyWith(status: FormStatus.loading));
  //   try {
  //     final ListResponse<Movies> movies = await repository.getMovies();
  //     emit(state.copyWith(
  //       status: FormStatus.loaded,
  //       movies: movies.data,
  //     ));
  //   } on CustomError catch (e) {
  //     emit(state.copyWith(
  //       status: FormStatus.error,
  //       error: e,
  //     ));
  //   }
  // }
}
