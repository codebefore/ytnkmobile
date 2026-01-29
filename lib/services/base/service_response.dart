class ServiceResponse<T> {
  final bool isSuccess;
  final String message;
  final bool isUnauthorized;
  final T? responseObject;

  ServiceResponse(
      this.isSuccess, this.message, this.responseObject, this.isUnauthorized);

  ServiceResponse.success({responseObject})
      : this(true, "", responseObject, false);

  ServiceResponse.fail(message, {isUnauthorized = false})
      : this(false, message is String ? message : message.toString(), null,
            isUnauthorized);
}
