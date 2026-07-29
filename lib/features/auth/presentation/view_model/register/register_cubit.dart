import 'package:blinkbuy/core/networking/result_api.dart';
import 'package:blinkbuy/features/auth/domain/entities/register_request_entity.dart';
import 'package:blinkbuy/features/auth/domain/use_case/register_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this._registerUseCase}) : super(RegisterInitial());
  final RegisterUseCase _registerUseCase;

  Future<void> intent(RegisterIntent intent) async {
    switch (intent) {
      case RegisterIntentRegister():
        _register(intent.request);
    }
  }

  Future<void> _register(RegisterRequestEntity request) async {
    emit(RegisterLoading());
    final result = await _registerUseCase.invoke(request);
    switch (result) {
      case Success<String>():
        emit(RegisterSuccess());
      case Error<String>():
        emit(RegisterError(result.messageError));
    }
  }
}

sealed class RegisterIntent {}

class RegisterIntentRegister extends RegisterIntent {
  final RegisterRequestEntity request;

  RegisterIntentRegister(this.request);
}
