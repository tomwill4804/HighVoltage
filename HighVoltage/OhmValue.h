//
//  OhmValue.h
//  HighVoltage
//
//  Created by Tom Williamson on 4/28/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>

enum ohmValueType {
    
    ohmValueWatts = 0,
    ohmValueVolts,
    ohmValueAmps,
    ohmValueOhms
    
};

@interface OhmValue : NSObject

@property float baseValue;
@property float multiplier;
@property float trueValue;
@property (strong, nonatomic) NSString* type;
@property (strong, nonatomic) NSString* subtype;
@property OhmValue* vtype;

@end
