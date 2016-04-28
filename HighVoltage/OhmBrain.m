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
    
    while (self.values.count < 4) {
        
        OhmValue* newvalue = [[OhmValue alloc] init];
        
        //
        //  calc volts
        //
        if (!volts && amps && ohms) {
            newvalue.baseValue = amps.trueValue * ohms.trueValue;
            newvalue.type = @"Volts";
        }
        else if (!volts && watts && amps) {
            newvalue.baseValue = watts.trueValue * amps.trueValue;
            newvalue.type = @"Volts";
        }
        else if (!volts && watts && ohms) {
            newvalue.baseValue = sqrt(watts.trueValue * ohms.trueValue);
            newvalue.type = @"Volts";
        }
        
        //
        //  calc ohms
        //
        else if (!ohms && volts && amps) {
            newvalue.baseValue = volts.trueValue / amps.trueValue;
            newvalue.type = @"Ohms";
        }
        
        //
        //  calc amps
        //
        else if (!amps && volts && ohms) {
            newvalue.baseValue = volts.trueValue / ohms.trueValue;
            newvalue.type = @"Amps";
        }
        
        //
        //  calc watts
        //
        else if (!watts && volts && amps) {
            newvalue.baseValue = volts.trueValue * amps.trueValue;
            newvalue.type = @"Watts";
        }
        
        //
        //  add new value
        //
        if (newvalue.type.length > 0)
            [self addValue:newvalue];
    }
    
}

-(void)addValue:(OhmValue *)value{
    
    [self.values addObject:value];
    
    if ([value.type isEqualToString:@"Volts"])
        volts = value;
    if ([value.type isEqualToString:@"Amps"])
        amps = value;
    if ([value.type isEqualToString:@"Watts"])
        watts = value;
    if ([value.type isEqualToString:@"Ohms"])
        ohms = value;
    
}
    
    
@end
