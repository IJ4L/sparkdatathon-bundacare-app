import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
    final BotResponse userPrompt;
    final BotResponse botResponse;

    ChatModel({
        required this.userPrompt,
        required this.botResponse,
    });

    factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        userPrompt: BotResponse.fromJson(json["user_prompt"]),
        botResponse: BotResponse.fromJson(json["bot_response"]),
    );

    Map<String, dynamic> toJson() => {
        "user_prompt": userPrompt.toJson(),
        "bot_response": botResponse.toJson(),
    };
}

class BotResponse {
    final String text;
    final DateTime createdAt;

    BotResponse({
        required this.text,
        required this.createdAt,
    });

    factory BotResponse.fromJson(Map<String, dynamic> json) => BotResponse(
        text: json["text"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "created_at": createdAt.toIso8601String(),
    };
}
