class ProviderResponse<T> {
  T? data;
  late bool status;
  String? message;

  ProviderResponse.completed({this.data}) : status = true;

  ProviderResponse.error(this.message) : status = false;
}
