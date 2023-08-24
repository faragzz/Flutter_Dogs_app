class DogData {
  final Map<String, List<String>> message;
  final String status;

  DogData({
    required this.message,
    required this.status,
  });

  factory DogData.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> messageJson = json['message'];
    final Map<String, List<String>> message = Map<String, List<String>>.from(
      messageJson.map((key, value) => MapEntry(key, List<String>.from(value))),
    );

    return DogData(
      message: message,
      status: json['status'],
    );
  }
}
