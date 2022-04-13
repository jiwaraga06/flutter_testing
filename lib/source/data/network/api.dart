String baseUrl = "http://94.74.86.174:8080/api";

class Api {
  static login() {
    return "$baseUrl/login";
  }

  static register() {
    return "$baseUrl/register";
  }

  static checklist() {
    return "$baseUrl/checklist";
  }
}
