class AppResult<T> {
  T? data;
  String? msg;
  AppResult._({this.data, this.msg});
  factory AppResult.success(T data) {
    return AppResult._(data: data, msg: "success");
  }
  factory AppResult.failure(String msg) {
    return AppResult._(data: null, msg: msg);
  }
}
