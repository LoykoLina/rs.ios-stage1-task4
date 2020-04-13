#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {

    NSMutableArray *result = [self decompose:number remainder:pow([number integerValue], 2)];
    if (result != nil) {
        [result removeLastObject];
        return result;
    } else {
       return nil;
    }
}

- (NSMutableArray *) decompose:(NSNumber *)number remainder:(NSInteger)remainder {
    NSMutableArray *array = [NSMutableArray new];

    if (remainder == 0) {
        [array addObject:number];
        return array;
    }

    for (NSInteger i = [number integerValue] - 1; i > 0; i--) {
        if (remainder - pow(i, 2) >= 0) {
            array = [self decompose:[NSNumber numberWithInteger:i] remainder:remainder - pow(i, 2)];

            if (array != nil) {
                [array addObject:number];
                return array;
            }
        }
    }
    return nil;
}

@end
