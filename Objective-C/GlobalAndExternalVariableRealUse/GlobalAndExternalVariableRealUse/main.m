#import <Foundation/Foundation.h>
#import "Foo.h"

int gNumber = 0;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"global number is %i", gNumber);
        
        Foo *f = [Foo new];
        [f setGlobalNumber:42];
        
        NSLog(@"global number is %i", gNumber);
    }
    
    return 0;
}
