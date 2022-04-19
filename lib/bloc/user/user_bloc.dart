import 'package:bloc/bloc.dart';
import 'package:estados_app/models/usuario.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));

    on<DeleteUser>((event, emit) => emit(const UserInitial()));

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (!state.existUser) return;
      final List<String> professions = [
        ...state.user!.profesiones,
        event.profesiones
      ];
      emit(UserSetState(state.user!.copyWith(profesiones: professions)));
    });
  }
}
