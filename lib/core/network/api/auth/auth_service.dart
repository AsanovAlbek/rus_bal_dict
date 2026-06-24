import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:rus_bal_dict/core/network/models/auth/auth_models.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String? baseUrl}) = _AuthService;

  @POST('/auth/jwt/login')
  @FormUrlEncoded()
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'accept': 'application/json'
  })
  Future<TokenResponse> login(
      @Field('username') String email, @Field('password') String password);

  @POST('/auth/jwt/register')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  })
  Future<RegisterResponse> register(@Body() UserRegisterBody userRegisterBody);

  @GET('/auth/jwt/current_user')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/x-www-form-urlencoded',
    'accept': 'application/json'
  })
  Future<UserResponse> getCurrentUser(
      @Header('Authorization') authorizationHeader);

  @POST('/auth/jwt/refresh_token')
  @Headers(<String, dynamic>{'Accept': 'application/json'})
  Future<RefreshTokenResponse> refreshToken(@Query('token') String token);

  @POST('/auth/jwt/activate_user')
  @Headers(<String, dynamic>{'Accept': 'application/json'})
  Future<UserActivationResponse> userActivation(
      @Header('Authorization') authorizationHeader, @Query('code') String code);

  @POST('/auth/jwt/confirm_reset_password')
  Future<ConfirmResetPasswordResponse> confirmResetPassword(
      @Query('email') String email, @Query('code') String code);

  @POST('/auth/jwt/change_password')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
    'accept': 'application/json',
  })
  Future<String> changePassword(
      @Query('email') String email, @Query('new_password') String newPassword);
}
