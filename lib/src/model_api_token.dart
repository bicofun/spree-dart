import 'dart:convert';

class APIToken {
  /// field: access_token
  final String accessToken;

  /// field: token_type
  final String tokenType;

  /// field: expires_in
  final int expiresIn;

  /// field: refresh_token
  final String refreshToken;

  /// field: created_at
  final DateTime createdAt;

  APIToken({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.refreshToken,
    required this.createdAt,
  });

  APIToken copyWith({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    String? refreshToken,
    DateTime? createdAt,
  }) =>
      APIToken(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        refreshToken: refreshToken ?? this.refreshToken,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, dynamic> toMap() => {
        'accessToken': accessToken,
        'tokenType': tokenType,
        'expiresIn': expiresIn,
        'refreshToken': refreshToken,
        'createdAt': (createdAt.millisecondsSinceEpoch / 1000).round(),
      };

  factory APIToken.fromMap(Map<String, dynamic> map) => APIToken(
        accessToken: map['access_token'],
        tokenType: map['token_type'],
        expiresIn: map['expires_in'],
        refreshToken: map['refresh_token'],
        createdAt: DateTime.fromMillisecondsSinceEpoch(
          (map['created_at'] as int) * 1000,
        ),
      );

  String toJson() => json.encode(toMap());

  factory APIToken.fromJson(String source) =>
      APIToken.fromMap(json.decode(source));

  @override
  String toString() => 'APIToken('
      'accessToken: $accessToken '
      'tokenType: $tokenType '
      'expiresIn: $expiresIn '
      'refreshToken: $refreshToken '
      'createdAt: $createdAt '
      ')';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is APIToken &&
        other.accessToken == accessToken &&
        other.tokenType == tokenType &&
        other.expiresIn == expiresIn &&
        other.refreshToken == refreshToken &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode =>
      accessToken.hashCode ^
      tokenType.hashCode ^
      expiresIn.hashCode ^
      refreshToken.hashCode ^
      createdAt.hashCode;
}
