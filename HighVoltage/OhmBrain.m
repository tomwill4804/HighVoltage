//
//  OhmBrain.m
//  HighVoltage
//
//  Created by Tom Williamson on 4/28/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "OhmBrain.h"

@implementation OhmBrain{
    
    OhmValue* volts;
    OhmValue* amps;
    OhmValue* watts;
    OhmValue* ohms;
    
}

+(NSArray*)validTypes{
    
    return @[@"Watts", @"Volts", @"Amps", @"Ohms"];
    
}


//
//  init a values array
//
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.values = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)doCalc{
    
    
}

-(void)addValue:(OhmValue *)value{
    
    [self.values addObject:value];
    
    if ([value.type isEqualToString:@"Volts"])
        volts = value;
    if ([value.type isEqualToString:@"Amps"])
        volts = value;
    if ([value.type isEqualToString:@"Watts"])
        volts = value;
    if ([value.type isEqualToString:@"Ohms"])
        volts = value;
    
}
@end
