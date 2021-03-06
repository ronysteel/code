#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *originalStrings = @[@"Kuala Lumpur", @"Johor", @"Penang", @"Sabah", @"Sarawak", @"Selangor"];

        NSLog(@"original strings: %@", originalStrings);
        
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        // Declare the block variable
        void (^devowelizer)(id, NSUInteger, BOOL *);
        
        // Compose a block and assign it to the block variable
        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            NSLog(@"string is %@, index is %lu", string, i);
            
            NSRange sRange = [string rangeOfString:@"s" options:NSCaseInsensitiveSearch];
            
            if (sRange.location != NSNotFound) { // we found a 's'
                *stop = YES; // note the use of dereferencing pointer here!
                
                NSLog(@"Oops, found a s, I am out!");
                
                return; // end this iteration
            }
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            // Iterate over the array of vowels, replacing occurrences of each
            // with an empty string
            for (NSString *vowel in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:vowel
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            
            [devowelizedStrings addObject:newString];
        };
        
        // Iterate over the array with block
        [originalStrings enumerateObjectsUsingBlock:devowelizer];
        
        NSLog(@"devowelized strings: %@", devowelizedStrings);
    }
    
    return 0;
}

/*

 2017-08-15 13:13:20.793040+0800 removeVowels[2517:107218] original strings: (
 "Kuala Lumpur",
 Johor,
 Penang,
 Sabah,
 Sarawak,
 Selangor
 )
 2017-08-15 13:13:20.793200+0800 removeVowels[2517:107218] string is Kuala Lumpur, index is 0
 2017-08-15 13:13:20.793271+0800 removeVowels[2517:107218] string is Johor, index is 1
 2017-08-15 13:13:20.793294+0800 removeVowels[2517:107218] string is Penang, index is 2
 2017-08-15 13:13:20.793306+0800 removeVowels[2517:107218] string is Sabah, index is 3
 2017-08-15 13:13:20.793313+0800 removeVowels[2517:107218] Oops, found a s, I am out!
 2017-08-15 13:13:20.793361+0800 removeVowels[2517:107218] devowelized strings: (
 "Kl Lmpr",
 Jhr,
 Pnng
 )
 Program ended with exit code: 0

*/
