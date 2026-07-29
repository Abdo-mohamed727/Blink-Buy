import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/auth/domain/entity/register_entity.dart';
import 'package:blinkbuy/features/auth/domain/use_case/register_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
part 'register_state.dart';
@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  bool obscureText = true;

  RegisterCubit(this._registerUseCase) : super(RegisterInitial());

  Future<void> register(RegisterRequestEntity requestRegister) async {
    emit(RegisterLoading());

    final result = await _registerUseCase(requestRegister);

    switch (result) {
      case Success<String>():
        emit(RegisterSuccess(message: result.data));

      case Error<String>():
        emit(RegisterError(messageError: result.messageError));
    }
  }

  void changeObscureText() {
    obscureText = !obscureText;

    emit(RegisterObscureTextChanged(obscureText: obscureText));
  }
}
