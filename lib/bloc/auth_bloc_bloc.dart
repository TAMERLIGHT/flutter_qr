import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/resources/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final AuthRepository _repository = AuthRepository();

  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<GetAuthEvent>((event, emit) async {
      emit(LoadingAuthState());
      try {
        final response = await _repository.onGetAuthEvent(event);
        if (response.statusCode == 200) {
          final responseBody = response.body;
          emit(LoadedAuthState(username: event.username, email: event.email, responseBody: responseBody));
          print(responseBody);
        } else {
          emit(FailureLoginState());
        }
      } catch (_) {
        emit(FailureLoginState());
      }
    });
  }
}
