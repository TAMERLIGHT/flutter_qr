import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

// События
abstract class FavoriteEvent {}

class FetchFavoriteData extends FavoriteEvent {}

// Состояния
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<Map<String, dynamic>> data;
  FavoriteLoaded(this.data);
}

class FavoriteError extends FavoriteState {
  final String error;
  FavoriteError(this.error);
}

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial());

  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is FetchFavoriteData) {
      yield FavoriteLoading();
      try {
        final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          yield FavoriteLoaded(List<Map<String, dynamic>>.from(data));
        } else {
          logger.d('Ошибка загрузки данных. HTTP код: ${response.statusCode}');
          throw Exception('Ошибка загрузки данных');
        }
      } catch (e) {
        logger.d('Произошла ошибка: $e');
        yield FavoriteError(e.toString());
      }
    }
  }
}
