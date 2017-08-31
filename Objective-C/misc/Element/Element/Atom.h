#import <Foundation/Foundation.h>
#import "Writer.h"

@interface Atom : NSObject <Writer>

@property (readonly) NSUInteger protons;
@property (readonly) NSUInteger neutrons;
@property (readonly) NSUInteger electrons;
@property (readonly) NSString *chemicalElement;

- (NSUInteger)massNumber;

@end