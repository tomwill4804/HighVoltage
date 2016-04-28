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

@property (strong, nonatomic)       OhmValue* ohmValue;

@property (weak, nonatomic)         NSMutableArray* types;

@property (weak, nonatomic) IBOutlet UITableView *typeTable;
@property (weak, nonatomic) IBOutlet UITableView *subtypeTable;
@property (weak, nonatomic) IBOutlet UITextField *inputValue;


@end
