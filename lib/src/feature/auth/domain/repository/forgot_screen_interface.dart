import '../../data/dto/forgot_dto.dart';
import '../model/forgot.dart';

abstract class IForgot {
    Future<ForgotDto> forgot(ForgotDto user);
}