import 'dart:async';

import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
import 'package:cloudbase_ce/cloudbase_ce.dart';
// import './wechat_kit.dart';
import 'qrAuthExt.dart';
import 'package:uuid/uuid.dart';

class QrAuthProvider extends AuthProvider {
  static var _qrauthRespSubs;
  static var gotQrCompleter = Completer<WechatGotQrcodeResp>();
  static var scanQrCompleter = Completer<WechatQrcodeScannedResp>();
  static var finishQrCompleter = Completer<WechatFinishResp>();

  Future<WechatGotQrcodeResp> getGotQrCompleter() => gotQrCompleter.future;
  Future<WechatQrcodeScannedResp> getScanQrCompleter() =>
      scanQrCompleter.future;
  Future<WechatFinishResp> getFinishQrCompleter() => finishQrCompleter.future;

  QrAuthProvider(CloudBaseCore core) : super(core) {
    debugPrint('qrauth init');
    _qrauthRespSubs = WechatKitPlatform.instance
        .qrauthRespStream()
        .listen((WechatQrauthResp resp) {
      if (resp is WechatGotQrcodeResp) {
        // debugPrint('Got qrcode');
        gotQrCompleter.complete(resp);
      } else if (resp is WechatQrcodeScannedResp) {
        // debugPrint('qrcode scanned');
        scanQrCompleter.complete(resp);
      } else if (resp is WechatFinishResp) {
        // debugPrint('qrauth finish');
        finishQrCompleter.complete(resp);
        _qrauthRespSubs.cancel();
        WechatKitPlatform.instance.stopQrauth();
      }
    });
  }

  void dispose() {
    _qrauthRespSubs.cancel();
    debugPrint('qrauth dispose');
  }

  Future<void> reqQrCode(
      String? wxAppId, String? wxAppSecret, String? wxUniLink) async {
    // 检查参数
    if (wxAppId == null || wxAppSecret == null || wxUniLink == null) {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.EMPTY_PARAM,
          message: "wxAppid or wxUniLink is null");
    }

    // 0. 获取 accessToken
    final accessToken = await getAccessToken();
    debugPrint('accessToken: $accessToken');

    // // 1. 获取 sdk_ticket
    // final sdk_ticket = await getSdkTicket();
    // debugPrint('sdk_ticket: $sdk_ticket');
    // // 2. 开始二维码扫描
    // await WechatKitPlatform.instance.startQrauth(
    //   appId: wxAppId,
    //   scope: <String>[WechatScope.kSNSApiUserInfo],
    //   noncestr: Uuid().v1().replaceAll('-', ''),
    //   ticket: ticket.ticket!,
    // );
  }

  Future<CloudBaseAuthState> signInByAuthCode(
      String? wxAppId, String? authCode) async {
    // 检查参数
    if (wxAppId == null || authCode == null) {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.EMPTY_PARAM,
          message: "wxAppid or wxUniLink is null");
    }

    // 3. 获取 Token
    final CloudBaseResponse? res =
        await CloudBaseRequest(super.core).postWithoutAuth('auth.getJwt', {
      'appid': wxAppId,
      'loginType': 'WECHAT-OPEN',
      'code': authCode,
      'syncUserInfo': true
    });
    // 4. 处理结果
    // 如果 res 为空，抛出异常
    if (res == null) {
      throw new CloudBaseException(
          code: CloudBaseExceptionCode.NULL_RESPONSE,
          message: "unknown error, res is null");
    }
    // 如果 res.code 不为空，抛出异常
    if (res.code != null) {
      throw new CloudBaseException(code: res.code, message: res.message);
    }
    // 如果 res.data 并且 res.data['refresh_token'] 不为空，返回成功
    if (res.data != null && res.data['refresh_token'] != null) {
      String refreshToken = res.data['refresh_token'];
      await setRefreshToken(refreshToken);
      await setAuthType(CloudBaseAuthType.WX);
      // 如果未过期，直接返回
      if (res.data['access_token'] != null &&
          res.data['access_token_expire'] != null) {
        await cache.setStore(cache.accessTokenKey, res.data['access_token']);
        await cache.setStore(
            cache.accessTokenExpireKey,
            res.data["access_token_expire"] +
                DateTime.now().millisecondsSinceEpoch);
      } else {
        // 如果过期，刷新token
        await refreshAccessToken();
      }
      // 返回成功结果
      return CloudBaseAuthState(
          authType: CloudBaseAuthType.WX, refreshToken: refreshToken);
    } else {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.AUTH_FAILED, message: '微信登录失败');
    }
    // return CloudBaseAuthState(
    //     authType: CloudBaseAuthType.EMPTY, refreshToken: '');
  }
}
