import 'dart:io';
void main(){
    String inp1 = stdin.readLineSync()!;
    if (inp1.toUpperCase() != "D") {
        print("Wrong answer");
    } else {
        print("Correct!");
    }
}
