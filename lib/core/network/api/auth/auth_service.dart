import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:rus_bal_dict/core/constants/private.dart';
import 'package:rus_bal_dict/core/network/models/auth/auth_models.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: '$testBaseUrl/auth/jwt')
abstract class AuthService {
  factory AuthService(Dio dio, {String? baseUrl}) = _AuthService;

  @POST('/login')
  @FormUrlEncoded()
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'accept': 'application/json'
  })
  Future<TokenResponse> login(
      @Field('username') String email, @Field('password') String password);

  @POST('/register')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  })
  Future<RegisterResponse> register(@Body() UserRegisterBody userRegisterBody);

  @GET('/get_current_user')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/x-www-form-urlencoded',
    'accept': 'application/json'
  })
  Future<UserResponse> getCurrentUser(
      @Header('Authorization') authorizationHeader);

  @POST('/refresh_token')
  @Headers(<String, dynamic>{'Accept': 'application/json'})
  Future<RefreshTokenResponse> refreshToken(@Query('token') String token);

  @POST('/user_activation')
  @Headers(<String, dynamic>{'Accept': 'application/json'})
  Future<UserActivationResponse> userActivation(
      @Header('Authorization') authorizationHeader, @Query('code') String code);

  @POST('/confirm_reset_password')
  @Headers(<String, dynamic>{'Accept': 'application/json'})
  Future<ConfirmResetPasswordResponse> confirmResetPassword(
    @Query('email') String email,
    @Query('code') String code
  );

  @POST('/change_password')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'accept': 'application/json',
  })
  Future<String> changePassword(@Header('Authorization') authorizationHeader,
      @Query('email') String email, @Query('new_password') String newPassword);
}
