library qr_auth_ext;

import 'dart:convert';
import 'dart:io';

part 'qrAuthExt.g.dart';

/// The extension class for `wechat_kit`.
class QrAuthExtension {
  const QrAuthExtension._();

////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// 微信 APP 扫码登录 ////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

  /// 获取 access_token
  static Future<WechatAccessTokenResp> getAccessToken({
    required String appId,
    required String appSecret,
  }) {
    return _createResponse(
      creator: _$WechatAccessTokenRespFromJson,
      url: 'https://api.weixin.qq.com/cgi-bin/token'
          '?grant_type=client_credential'
          '&appid=$appId'
          '&secret=$appSecret',
    );
  }

  /// 用上面的函数拿到的 access_token，获取 sdk_ticket
  static Future<WechatTicketResp> getTicket({
    required String accessToken,
  }) {
    return _createResponse(
      creator: _$WechatTicketRespFromJson,
      url: 'https://api.weixin.qq.com/cgi-bin/ticket/getticket'
          '?access_token=$accessToken'
          '&type=2',
    );
  }
}

/// Base WeChat API response model.
abstract class WechatAPIResp {
  const WechatAPIResp({required this.errorCode, this.errorMsg});

  /// 成功
  static const int errorCodeSuccess = 0;

  /// -1	   系统繁忙，此时请开发者稍候再试
  /// 0      请求成功
  /// 40001	 AppSecret 错误或者 AppSecret 不属于这个公众号，请开发者确认 AppSecret 的正确性
  /// 40002  请确保 grant_type 字段值为 client_credential
  /// 40164  调用接口的 IP 地址不在白名单中，请在接口 IP 白名单中进行设置。（小程序及小游戏调用不要求 IP 地址在白名单内。）
  final int errorCode;
  final String? errorMsg;

  bool get isSuccessful => errorCode == errorCodeSuccess;

  Map<String, dynamic> toJson();

  @override
  String toString() => const JsonEncoder.withIndent('  ').convert(toJson());
}

class WechatAccessTokenResp extends WechatAPIResp {
  const WechatAccessTokenResp({
    required int errorCode,
    String? errorMsg,
    this.openid,
    this.scope,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
  }) : super(errorCode: errorCode, errorMsg: errorMsg);

  factory WechatAccessTokenResp.fromJson(Map<String, dynamic> json) =>
      _$WechatAccessTokenRespFromJson(json);

  final String? openid;
  final String? scope;
  final String? accessToken;
  final String? refreshToken;
  final int? expiresIn; // 单位：秒

  @override
  Map<String, dynamic> toJson() => _$WechatAccessTokenRespToJson(this);
}

class WechatTicketResp extends WechatAPIResp {
  const WechatTicketResp({
    required int errorCode,
    String? errorMsg,
    this.ticket,
    this.expiresIn,
  }) : super(errorCode: errorCode, errorMsg: errorMsg);

  factory WechatTicketResp.fromJson(Map<String, dynamic> json) =>
      _$WechatTicketRespFromJson(json);

  final String? ticket;
  final int? expiresIn;

  @override
  Map<String, dynamic> toJson() => _$WechatTicketRespToJson(this);
}

class WechatUserInfoResp extends WechatAPIResp {
  const WechatUserInfoResp({
    required int errorCode,
    String? errorMsg,
    this.openid,
    this.nickname,
    this.sex,
    this.province,
    this.city,
    this.country,
    this.headimgurl,
    this.privilege,
    this.unionid,
  }) : super(errorCode: errorCode, errorMsg: errorMsg);

  factory WechatUserInfoResp.fromJson(Map<String, dynamic> json) =>
      _$WechatUserInfoRespFromJson(json);

  final String? openid;
  final String? nickname;
  final int? sex; // 1为男性，2为女性
  final String? province;
  final String? city;
  final String? country;
  final String? headimgurl;
  final List<dynamic>? privilege;
  final String? unionid;

  bool get isMale => sex == 1;

  bool get isFemale => sex == 2;

  @override
  Map<String, dynamic> toJson() => _$WechatUserInfoRespToJson(this);
}

typedef _DataFactory<T extends WechatAPIResp> = T Function(
  Map<String, dynamic>,
);

Future<T> _createResponse<T extends WechatAPIResp>({
  required _DataFactory<T> creator,
  required String url,
}) async {
  final Uri uri = Uri.parse(url);
  final HttpClientRequest request = await HttpClient().getUrl(uri);
  final HttpClientResponse response = await request.close();
  if (response.statusCode == HttpStatus.ok) {
    final String content = await utf8.decodeStream(response);
    return creator(json.decode(content) as Map<String, dynamic>);
  }
  throw HttpException(
    'HttpResponse statusCode: ${response.statusCode}, '
    'reasonPhrase: ${response.reasonPhrase}.',
  );
}
