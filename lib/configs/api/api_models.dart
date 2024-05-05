class CoreResponseApi {
  final bool success;
  final bool status;

  CoreResponseApi({
    required this.success,
    required this.status,
  });
}

class HttpResponse<T> extends CoreResponseApi {
  final T? data;
  final Details? details;
  final Map<String, List<String>>? errors;
  final String? error;
  final String message;

  HttpResponse({
    required bool success,
    required bool status,
    required this.data,
    this.details,
    this.errors,
    this.error,
    required this.message,
    // Pass the required arguments to the superclass constructor
  }) : super(
          // Pass the required parameters to the superclass constructor
          success: success,
          status: status,
        );

  HttpResponse.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        details = Details.fromJson(json['details']),
        errors = (json['errors'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, List<String>.from(value as List))),
        error = json['error'],
        message = json['message'],
        // Call the superclass constructor with required arguments
        super(success: json['success'], status: json['status']);
}

class Details {
  final String path;
  final String query;
  final int statusCode;
  final String method;
  final String status;

  Details({
    required this.path,
    required this.query,
    required this.statusCode,
    required this.method,
    required this.status,
  });
  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      path: json['path'],
      query: json['query'],
      statusCode: json['statusCode'],
      method: json['method'],
      status: json['status'],
    );
  }
}

class ResponseUseCase<T> {
  final bool valid;
  final String message;
  final int? statusCode;
  final T? data;

  ResponseUseCase({
    required this.valid,
    required this.message,
    this.statusCode,
    this.data,
  });

  factory ResponseUseCase.fromJson(Map<String, dynamic> json) {
    return ResponseUseCase<T>(
      valid: json['valid'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['statusCode'],
      data: json['data'] as T?, // Cast 'data' to type T
    );
  }
}
