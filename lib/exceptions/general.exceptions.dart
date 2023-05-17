class GeneralException implements Exception{
  String message;
  GeneralException([this.message =  "Seomthing went wrong"]){
    message = "Exception: $message";
  }

  @override
  String toString(){
    return message;
  }
}
