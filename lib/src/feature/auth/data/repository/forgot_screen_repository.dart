import 'package:dio/dio.dart';
import '../../domain/model/forgot.dart';
import '../../domain/repository/forgot_screen_interface.dart';
import '../dto/forgot_dto.dart';

class ForgotScreenRepository implements IForgot {
    @override
    Future<Forgot> forgot(Forgot user) async {
        final dto = ForgotDto.fromDomain(user);
        final response = await Dio().post(
            'http://10.0.2.2:3000/forgot',
            queryParameters: dto.toJson(),
        );

        if (response.statusCode == 200) {
            final token = response.headers.value('Authorization');
            final domain = forgotUser(user.email, token: token);
            return Future.value(domain);
        } else {
            throw Exception(response.headers['Message']);
        }
    }
    
      forgotUser(String email, {String? token}) {}
}