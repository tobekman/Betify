import 'dart:convert';

class ErrorResponse {
  final String type;
  final String title;
  final int status;
  final String traceId;
  ErrorResponse({
    required this.type,
    required this.title,
    required this.status,
    required this.traceId,
  });

  ErrorResponse copyWith({
    String? type,
    String? title,
    int? status,
    String? traceId,
  }) {
    return ErrorResponse(
      type: type ?? this.type,
      title: title ?? this.title,
      status: status ?? this.status,
      traceId: traceId ?? this.traceId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'title': title,
      'status': status,
      'traceId': traceId,
    };
  }

  factory ErrorResponse.fromMap(Map<String, dynamic> map) {
    return ErrorResponse(
      type: map['type'] as String,
      title: map['title'] as String,
      status: map['status'].toInt() as int,
      traceId: map['traceId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorResponse.fromJson(String source) => ErrorResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ErrorResponse(type: $type, title: $title, status: $status, traceId: $traceId)';
  }

  @override
  bool operator ==(covariant ErrorResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.type == type &&
      other.title == title &&
      other.status == status &&
      other.traceId == traceId;
  }

  @override
  int get hashCode {
    return type.hashCode ^
      title.hashCode ^
      status.hashCode ^
      traceId.hashCode;
  }
}