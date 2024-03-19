import 'package:bloc/bloc.dart';
import 'package:cubit_deneme/bloc/cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit() : super(const CatsInitial());

  void getCats() async {
    try {
      emit(const CatsLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      final response = await Future.value(["a", "b"]);
      emit(CatsCompleted(response));
    } catch (e) {
      emit(CatsError("HATAAA : $e"));
    }
  }
}
