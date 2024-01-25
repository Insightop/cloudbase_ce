/// No original pub package

import 'package:flutter/cupertino.dart';

import 'package:cloudbase_ce/cloudbase_ce.dart';

//enum SIGN_METHOD { SIGNIN, SIGNUP, FORCERESETPWD }

class PhoneCodeAuthProvider extends AuthProvider {
  PhoneCodeAuthProvider(CloudBaseCore core) : super(core);

  Future<bool> sendPhoneCode({required String? phoneNumber}) async {
    if (phoneNumber == null) {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.EMPTY_PARAM, message: "phone is null");
    }

    final CloudBaseResponse? res = await CloudBaseRequest(super.core)
        .postWithoutAuth('auth.sendPhoneCode', {'phoneNumber': phoneNumber});

    if (res == null) {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.NULL_RESPONSE,
          message: "unknown error, res is null");
    } else {
      debugPrint('Response: data: ' + res.data.toString());
      // 短信发送成功
      // Response: data: {requestId: 1159787f869ba, data: {SendStatus: Ok}}

      return res.data["data"]["SendStatus"] == 'Ok';
    }

    /*
    if (res.code != null) {
      //debugPrint( 'SMS ERROR: ' + res.message! + ' code: ' + res.code.toString());
      throw new CloudBaseException(code: res.code, message: res.message);
    }

    if (res.data != null && res.data['refresh_token'] != null) {
      String refreshToken = res.data['refresh_token'];
      await setRefreshToken(refreshToken);
      await setAuthType(CloudBaseAuthType.PHONECODE );

      if (res.data['access_token'] != null &&
          res.data['access_token_expire'] != null) {
        await cache.setStore(cache.accessTokenKey, res.data['access_token']);
        await cache.setStore(
            cache.accessTokenExpireKey,
            res.data["access_token_expire"] +
                DateTime.now().millisecondsSinceEpoch);
      } else {
        await refreshAccessToken();
      }

      return CloudBaseAuthState(
          authType: CloudBaseAuthType.PHONECODE, refreshToken: refreshToken);
    } else {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.AUTH_FAILED, message: '短信发送失败');
    }

     */
  }

  Future<CloudBaseAuthState> signInWithPhoneCode(
      {required String? phoneNumber,
      String? phoneCode,
      String? password,
      String? signMethod}) async {
    if (phoneNumber == null) {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.EMPTY_PARAM, message: "phone is null");
    }

    final CloudBaseResponse? res =
        await CloudBaseRequest(super.core).postWithoutAuth('auth.signIn', {
      'loginType': 'PHONE',
      'phoneNumber': phoneNumber,
      'phoneCode': phoneCode,
      'password': password,
      'refresh_token': cache.refreshTokenKey,
      'signMethod': signMethod,
    });

    if (res == null) {
      throw new CloudBaseException(
          code: CloudBaseExceptionCode.NULL_RESPONSE,
          message: "unknown error, res is null");
    }

    if (res.data != null && res.data['refresh_token'] != null) {
      String refreshToken = res.data['refresh_token'];
      await setRefreshToken(refreshToken);
      await setAuthType(CloudBaseAuthType.PHONECODE);

      if (res.data['access_token'] != null &&
          res.data['access_token_expire'] != null) {
        await cache.setStore(cache.accessTokenKey, res.data['access_token']);
        await cache.setStore(
            cache.accessTokenExpireKey,
            res.data["access_token_expire"] +
                DateTime.now().millisecondsSinceEpoch);
      } else {
        await refreshAccessToken();
      }
      return CloudBaseAuthState(
          authType: CloudBaseAuthType.PHONECODE, refreshToken: refreshToken);
    } else {
      // 短信登录失败
      //debugPrint( 'SMS ERROR: ' + res.message! + ' code: ' + res.code.toString() + 'data: ' + res.data.toString() );
      throw CloudBaseException(
          code: CloudBaseExceptionCode.AUTH_FAILED, message: '短信登录失败');
    }
  }

  Future<CloudBaseAuthState> signUpWithPhoneCode(
      {required String? phoneNumber,
      String? phoneCode,
      String? password,
      String? signMethod}) async {
    if (phoneNumber == null) {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.EMPTY_PARAM, message: "phone is null");
    }

    final CloudBaseResponse? res =
        await CloudBaseRequest(super.core).postWithoutAuth('auth.signIn', {
      'loginType': 'PHONE',
      'phoneNumber': phoneNumber,
      'phoneCode': phoneCode,
      'password': password,
      'refresh_token': cache.refreshTokenKey,
      'signMethod': signMethod,
    });

    if (res == null) {
      throw new CloudBaseException(
          code: CloudBaseExceptionCode.NULL_RESPONSE,
          message: "unknown error, res is null");
    }

    if (res.code != null) {
      debugPrint(
          'SMS ERROR: ' + res.message! + ' code: ' + res.code.toString());
      throw new CloudBaseException(code: res.code, message: res.message);
    }

    if (res.data != null && res.data['refresh_token'] != null) {
      String refreshToken = res.data['refresh_token'];
      await setRefreshToken(refreshToken);
      await setAuthType(CloudBaseAuthType.PHONECODE);

      if (res.data['access_token'] != null &&
          res.data['access_token_expire'] != null) {
        await cache.setStore(cache.accessTokenKey, res.data['access_token']);
        await cache.setStore(
            cache.accessTokenExpireKey,
            res.data["access_token_expire"] +
                DateTime.now().millisecondsSinceEpoch);
      } else {
        await refreshAccessToken();
      }

      return CloudBaseAuthState(
          authType: CloudBaseAuthType.PHONECODE, refreshToken: refreshToken);
    } else {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.AUTH_FAILED, message: '短信注册失败');
    }
  }
}
