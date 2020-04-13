#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSInteger result = 1;
    
    NSMutableArray *arr = [self deleteStringsFromArray:array];
    if ([arr count] == 0) {
        return 0;
    }
    
    if (numberOfItems >= [arr count]) {
        for (NSNumber *number in arr) {
            result *= [number integerValue];
        }
    } else {
        arr = [NSMutableArray arrayWithArray:[arr sortedArrayUsingSelector: @selector(compare:)]];
        
        if (numberOfItems == 1) {
            result = [arr[[arr count]-1] integerValue];
        } else if (numberOfItems == 2) {
            result = [self maxProdactOfTwoInArray:arr toReduceArray:false];
        } else {
            for (NSInteger i = numberOfItems / 2; i > 0; --i) {
                result *= [self maxProdactOfTwoInArray:arr toReduceArray:true];
            }
            if (numberOfItems % 2 == 1) {
                NSInteger a = [arr[0] integerValue];
                NSInteger b = [arr[[arr count] - 1] integerValue];
                result *= a > b ? a : b;
            }
        }
    }
    
    return result;
}

+ (NSInteger)maxProdactOfTwoInArray:(NSMutableArray *)arr toReduceArray:(BOOL)flag {
    NSInteger res1 = [arr[0] integerValue] * [arr[1] integerValue];
    NSInteger res2 = [arr[[arr count]-1] integerValue] * [arr[[arr count]-2] integerValue];
    if (!flag) {
        return res1 > res2 ? res1 : res2;
    } else {
        if (res1 > res2) {
            [arr removeObjectAtIndex:0];
            [arr removeObjectAtIndex:0];
            return res1;
        } else {
            [arr removeObjectAtIndex:[arr count] - 1];
            [arr removeObjectAtIndex:[arr count] - 1];
            return res2;
        }
    }
}

+ (NSMutableArray *) deleteStringsFromArray:(NSArray *)arr {
    NSMutableArray *array = [NSMutableArray new];
    for (NSInteger i = 0; i < [arr count]; i++) {
        if (![arr[i] isKindOfClass:[NSString class]]) {
            [array addObject:arr[i]];
        }
    }
    return array;
}

@end
