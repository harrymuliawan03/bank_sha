class ResponseDatabase<T> {
  final bool valid;
  final String message;
  final int? statusCode;
  final List<T>? data;

  ResponseDatabase({
    required this.valid,
    required this.message,
    this.statusCode,
    this.data,
  });

  factory ResponseDatabase.fromJson(Map<String, dynamic> json) {
    return ResponseDatabase<T>(
      valid: json['valid'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['statusCode'],
      data: json['data'] as List<T>?, // Cast 'data' to type T
    );
  }
}
