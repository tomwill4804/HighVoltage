//
//  ValueCell.h
//  HighVoltage
//
//  Created by Tom Williamson on 4/28/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValueCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* baseValue;
@property (weak, nonatomic) IBOutlet UILabel* subType;
@property (weak, nonatomic) IBOutlet UILabel* trueValue;
@property (weak, nonatomic) IBOutlet UILabel* type;;

@end
