#include <stdio.h>
#include <stdbool.h>
#include <math.h>

// To find the next prime number greater than a specified number

int main(int argc, const char * argv[]) {
    bool isPrime;
    int startingPoint, candidate, last, i;
    
    startingPoint = 42;
    
    if (startingPoint < 2) {
        candidate = 2; // 2 is the smaller prime number
    } else if (startingPoint == 2) {
        candidate = 3; // 3 is the next prime after 2
    } else {
        candidate = startingPoint;
        
        if (candidate % 2 == 0) { // test only odd numbers
            candidate--;
        }
        
        do {
            // the value of candidate here will always be odd numbers after
            // we filter out even numbers above
            isPrime = true; // assume it is a prime
            candidate += 2; // bump up to next number, because we minus one above, and we don't need to check for that number
            printf("do: candidate = %d\n", candidate);
            
            // if you don't find a factor by the time you hit the square root,
            // there won't be a factor, and the candidate is prime
            // e.g. factors of 12 is 1, 2, 3, 4, 6, 12
            // square root of 12 is around 3.46, and each factor pair with another
            // factor greater than the square root to get the value of 3, i.e 2 x 6, 3 x 4, etc
            // therefore, we don't need to check all the factors, just need to check all
            // factors that are less than the square root
            last = sqrt(candidate);
            printf("do: last = %d\n", last);
            
            // check to see candidate has any factors, from 3 to last
            // loop through odd numbers only
            for (i = 3; (i <= last) && isPrime; i += 2) {
                // verify candidate has no factors other than 1 and candidate
                if ((candidate % i) == 0) {
                    isPrime = false;
                }
            }
        } while (!isPrime);
    }
    
    printf("The next prime after %d is %d\n", startingPoint, candidate);
    
    return 0;
}
