#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    if ([number integerValue] < 0) {
        return nil;
    }
    
    NSMutableArray * result = [NSMutableArray new];
    
    for (NSInteger i = 0; i < [number length]; i++) {
        NSMutableString *phoneNumber = [number mutableCopy];
        NSString *num = [NSString stringWithFormat:@"%c", [number characterAtIndex:i]];
        NSArray *neighbors = [self getNeighborsOfNumber:num];
        
        for (NSString *str in neighbors) {
            [phoneNumber replaceCharactersInRange:NSMakeRange(i, 1) withString:str];
            [result addObject:[NSString stringWithString:phoneNumber]];
        }
    }
    
    return result;
}

- (NSArray *) getNeighborsOfNumber:(NSString *)number {
    switch ([number integerValue]) {
        case 0:
            return @[@"8"];
            break;
        case 1:
            return @[@"2", @"4"];
            break;
        case 2:
            return @[@"1", @"3", @"5"];
            break;
        case 3:
            return @[@"2", @"6"];
            break;
        case 4:
            return @[@"1", @"5", @"7"];
            break;
        case 5:
            return @[@"2", @"4", @"6", @"8"];
            break;
        case 6:
            return @[@"3", @"5", @"9"];
            break;
        case 7:
            return @[@"4", @"8"];
            break;
        case 8:
            return @[@"5", @"7", @"9", @"0"];
            break;
        case 9:
            return @[@"6", @"8"];
            break;
        default:
            return nil;
    }
}

@end
