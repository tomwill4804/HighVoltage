//
//  ViewController.m
//  HighVoltage
//
//  Created by Tom Williamson on 4/28/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "ViewController.h"
#import "ValueViewController.h"
#import "OhmValue.h"
#import "ValueCell.h"
#import "OhmBrain.h"

@interface ViewController () {
    
    OhmBrain *brain;
    NSMutableArray* valueTypes;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self clearButtonClicked:nil];
    
}

#pragma mark - Table View

//
//  one section
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


//
//  one row for each value
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return brain.values.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ValueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ValueCell"];
    OhmValue* value = brain.values[indexPath.row];
    
    cell.baseValue.text = [NSString stringWithFormat:@"%g", value.baseValue];
    cell.subType.text = value.subtype;
    if (value.baseValue != value.trueValue) {
        cell.type.text = value.type;
        cell.trueValue.text = [NSString stringWithFormat:@"%g", value.trueValue];
    }
    else {
        cell.type.text = nil;
        cell.trueValue.text = nil;
    }
    
    return cell;
    
}



-(IBAction)clearButtonClicked:(id)sender{
    
    brain = [[OhmBrain alloc] init];
    valueTypes = [NSMutableArray arrayWithArray:[OhmBrain validTypes]];
    self.addButton.enabled = YES;
    
    [self.tableView reloadData];
    
}

//
//  set values array for selector
//
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
    ValueViewController *vc = (ValueViewController *)segue.destinationViewController;
    vc.types = valueTypes;
    
}


//
//  back from segue build a new entry in the array
//
-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
    ValueViewController *vc = (ValueViewController *)segue.sourceViewController;
    
    if (vc.ohmValue) {
        [brain addValue:vc.ohmValue];
        [valueTypes removeObject:vc.ohmValue.type];
        [self.tableView reloadData];
    }
    
    //
    //  if we have two entries we can do the calculation
    //
    if (brain.values.count == 2){
        self.addButton.enabled = NO;
        [brain doCalc];
        [self.tableView reloadData];
        
    }
    
}


@end
