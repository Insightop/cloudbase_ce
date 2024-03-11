// GENERATED CODE - DO NOT MODIFY BY HAND

part of qr_auth_ext;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WechatAccessTokenResp _$WechatAccessTokenRespFromJson(
        Map<String, dynamic> json) =>
    WechatAccessTokenResp(
      errorCode: json['errcode'] as int? ?? 0,
      errorMsg: json['errmsg'] as String?,
      openid: json['openid'] as String?,
      scope: json['scope'] as String?,
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      expiresIn: json['expires_in'] as int?,
    );

Map<String, dynamic> _$WechatAccessTokenRespToJson(
        WechatAccessTokenResp instance) =>
    <String, dynamic>{
      'errcode': instance.errorCode,
      'errmsg': instance.errorMsg,
      'openid': instance.openid,
      'scope': instance.scope,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
    };

WechatTicketResp _$WechatTicketRespFromJson(Map<String, dynamic> json) =>
    WechatTicketResp(
      errorCode: json['errcode'] as int? ?? 0,
      errorMsg: json['errmsg'] as String?,
      ticket: json['ticket'] as String?,
      expiresIn: json['expires_in'] as int?,
    );

Map<String, dynamic> _$WechatTicketRespToJson(WechatTicketResp instance) =>
    <String, dynamic>{
      'errcode': instance.errorCode,
      'errmsg': instance.errorMsg,
      'ticket': instance.ticket,
      'expires_in': instance.expiresIn,
    };

WechatUserInfoResp _$WechatUserInfoRespFromJson(Map<String, dynamic> json) =>
    WechatUserInfoResp(
      errorCode: json['errcode'] as int? ?? 0,
      errorMsg: json['errmsg'] as String?,
      openid: json['openid'] as String?,
      nickname: json['nickname'] as String?,
      sex: json['sex'] as int?,
      province: json['province'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      headimgurl: json['headimgurl'] as String?,
      privilege: json['privilege'] as List<dynamic>?,
      unionid: json['unionid'] as String?,
    );

Map<String, dynamic> _$WechatUserInfoRespToJson(WechatUserInfoResp instance) =>
    <String, dynamic>{
      'errcode': instance.errorCode,
      'errmsg': instance.errorMsg,
      'openid': instance.openid,
      'nickname': instance.nickname,
      'sex': instance.sex,
      'province': instance.province,
      'city': instance.city,
      'country': instance.country,
      'headimgurl': instance.headimgurl,
      'privilege': instance.privilege,
      'unionid': instance.unionid,
    };
