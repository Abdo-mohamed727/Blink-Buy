import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/auth/domain/entity/login_entity.dart';
import 'package:blinkbuy/features/auth/domain/use_case/login_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  bool obscureText;

  LoginCubit(this.loginUseCase, {this.obscureText = true})
    : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    final result = await loginUseCase(email, password);

    switch (result) {
      case Success<LoginEntity>():
        final entity = result.data;

        emit(
          LoginSuccess(
            message: entity.message ?? '',
            token: entity.token ?? '',
          ),
        );

      case Error<LoginEntity>():
        emit(LoginError(messageError: result.messageError));
    }
  }

  void changeObscureText() {
    obscureText = !obscureText;

    emit(LoginObscureTextChanged(obscureText: obscureText));
  }
}
