import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:rus_bal_dict/core/constants/private.dart';
import 'package:rus_bal_dict/core/network/models/mail/mail_models.dart';

part 'mail_service.g.dart';

@RestApi(baseUrl: '$testBaseUrl/mail')
abstract class MailService {
  factory MailService(Dio dio, {String? baseUrl}) = _MailService;

  @POST('/get_reset_code')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'accept': 'application/json',
  })
  Future<GetCodeResponse> sendResetCode(@Query('email') String email);

  @POST('/get_activation_code')
  @Headers(<String, dynamic>{'Accept': 'application/json'})
  Future<GetCodeResponse> sendActivationCode(
      @Header('Authorization') authorizationHeader);
}
