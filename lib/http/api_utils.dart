class ApiUtils {
  static const String login_url = "base/login/";

  static String getPath({String path: '', int page, int pagesize}) {
    StringBuffer sb = new StringBuffer(path);
    if (page != null) {
      sb.write('/$page');
    }
    if (pagesize != null) {
      sb.write('/$pagesize');
    }
    return sb.toString();
  }
}
