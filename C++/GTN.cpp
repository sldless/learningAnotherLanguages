#include <iostream>

//Guess The Number

using namespace std;
int main()
{
    int number, guess, guessLeft;
    guessLeft = 5;
    srand(time(NULL));
    for(int i=0;i<1;i++)
      number = rand() % 100 + 1;  
    std::cout << "Guess the number between 1 and 100" << std::endl;
    std::cin >> guess;
    while(guess != number && guessLeft > 1)
    {
        if(guess < number)
        {
            std::cout << "Your guess is lower than the number" << std::endl;
        }
        else
        {
            std::cout << "Your guess is higher than the number" << std::endl;
        }
        guessLeft--;
        std::cout << "You have " << guessLeft << " guesses left" << std::endl;
        std::cin >> guess;
    }
    if (guess == number)
    {
        std::cout << "You got the correct number,  congrats!" << std::endl;
    }
    else
    {
        std::cout << "You ran out of guesses and loss" << std::endl;
        printf("The number was %d\n", number);
    }

    return 0 ;
}

