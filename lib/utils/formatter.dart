class Formatter {
  static String formatLink({String baseUrl, String inputString}) {
    //if inputString starts with a @ or https, remove it
    if(inputString.startsWith("http")){
      return inputString;
    } else if (inputString.startsWith("@")){
      return baseUrl + inputString.substring(1);
    }
    return baseUrl + inputString;
  }

  static T cast<T>(x) => x is T ? x : null;
}