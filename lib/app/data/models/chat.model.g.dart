// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return MessageModel(
    id: json['id'] as String,
    sender: json['sender'] == null
        ? null
        : UserModel.fromJson(json['sender'] as Map<String, dynamic>),
    target: json['target'] == null
        ? null
        : UserModel.fromJson(json['target'] as Map<String, dynamic>),
    content: json['content'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender?.toJson(),
      'target': instance.target?.toJson(),
      'content': instance.content,
      'type': instance.type,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

MessageSend _$MessageSendFromJson(Map<String, dynamic> json) {
  return MessageSend(
    target: json['target'] as String,
    content: json['content'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$MessageSendToJson(MessageSend instance) =>
    <String, dynamic>{
      'target': instance.target,
      'content': instance.content,
      'type': instance.type,
    };
