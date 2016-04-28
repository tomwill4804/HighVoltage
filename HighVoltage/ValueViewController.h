//
//  ValueViewController.h
//  HighVoltage
//
//  Created by Tom Williamson on 4/28/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OhmValue.h"

@interface ValueViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)   OhmValue* value;
@property (weak, nonatomic)     NSMutableArray* types;


@end
