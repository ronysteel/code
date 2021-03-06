#import "Person.h"

@interface Student : Person

{
    NSArray *_classes;
    NSNumber *_numberOfCredits;
    NSString *_major;
}

- (id)initWithName:(NSString *)name age:(NSNumber *)age gender:(Gender)gender classes:(NSArray *)classes numberOfCredits:(NSNumber *)numberOfCredits major:(NSString *)major;

@end
