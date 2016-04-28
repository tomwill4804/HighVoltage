//
//  OhmBrain.h
//  HighVoltage
//
//  Created by Tom Williamson on 4/28/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OhmValue.h"

@interface OhmBrain : NSObject

@property (strong, nonatomic) NSMutableArray* values;

+(NSArray*)validTypes;

-(void)doCalc;
-(void)addValue:(OhmValue*)value;


@end
