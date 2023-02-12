import 'dart:io';
import 'dart:math';

main() {
  game();
}

game() {
  print("Now we will play rock,paper and scissors game.\nMax point is 3.");

  List<String> options = [
    'rock',
    'paper',
    'scissors'
  ];
  int userPoint = 0;
  int compPoint = 0;
  Random random = new Random();

  while (userPoint != 3 || compPoint != 3) {
    print("Your choice - ");
    String userChoice = (stdin.readLineSync()!).toLowerCase();

    while (!checkValidity(userChoice)) {
      print("please enter again");
      userChoice = (stdin.readLineSync()!).toLowerCase();

      if (checkValidity(userChoice) == true) {
        break;
      } else {
        continue;
      }
    }

    String compChoice = options[random.nextInt(2)];
    print("*********************\ncomp choice is $compChoice,\nuser Choice is - $userChoice");
    if ((compChoice == 'rock' && userChoice == 'scissors') || (compChoice == 'paper' && userChoice == 'rock') || (compChoice == 'scissors' && userChoice == 'paper')) {
      compPoint++;
      print('Computer won this round \nComp score - $compPoint\nUser Score - $userPoint');
    } else if ((userChoice == 'rock' && compChoice == 'scissors') || (userChoice == 'paper' && compChoice == 'rock') || (userChoice == 'scissors' && compChoice == 'paper')) {
      userPoint++;
      print('User won this round \nComp score - $compPoint\nUser Score - $userPoint');
    } else {
      print('draw');
    }
    if (userPoint == 3) {
      print('User won');
      break;
    } else if (compPoint == 3) {
      print('Comp won');
      break;
    }
  }
  print("Do you want to play again?[y/n]");
  String answer = (stdin.readLineSync()!).toLowerCase();
  if (answer == 'y') {
    game();
  } else {
    print('Goodbye');
  }
}

bool checkValidity(String userChoice) {
  if (userChoice == 'rock' || userChoice == 'paper' || userChoice == 'scissors') {
    return true;
  } else {
    return false;
  }
}
