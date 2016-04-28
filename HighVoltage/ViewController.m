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

@interface ViewController () {
    
    NSMutableArray* values;
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

    return values.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    OhmValue* value = values[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%f", value.baseValue];
    cell.detailTextLabel.text = value.type;
    
    return cell;
    
}



-(IBAction)clearButtonClicked:(id)sender{
    
    values = nil;
    valueTypes = [@[@"Watts", @"Volts", @"Amps", @"Ohms"] mutableCopy];
    self.addButton.enabled = YES;
    
}

//
//  set values array for selector
//
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
    ValueViewController *vc = (ValueViewController *)segue.destinationViewController;
    vc.types = valueTypes;
    
}


//
//  back from segue so reload table
//
-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
    
  
    
}


@end
