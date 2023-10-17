import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/resources/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final _repository = AuthRepository();
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<AuthBlocEvent>((event, emit) => emit(AuthBlocInitial()));
    on<GetAuthEvent>(_repository.onGetAuthEvent);
  }
}
