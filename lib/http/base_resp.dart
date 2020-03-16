import 'package:dio/dio.dart';

class BaseResp<T> {
  int status;
  String msg;
  T data;
  Response response;

  BaseResp(this.status, this.msg, this.data);

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"msg\":\"$msg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

/// <BaseRespR<T> 返回 status code msg data Response.
class BaseRespR<T> {
  int status;
  String msg;
  T data;
  Response response;

  BaseRespR(this.status, this.msg, this.data, this.response);

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"status\":\"$status\"");
    sb.write(",\"msg\":\"$msg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}
