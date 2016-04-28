//
//  ValueViewController.m
//  HighVoltage
//
//  Created by Tom Williamson on 4/28/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "ValueViewController.h"

@interface ValueViewController () {
    
    NSMutableArray* subTypes;
    NSArray* subTypeFactors;
    
}

@end

@implementation ValueViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}



//
//  one section
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
    
}


//
//  return count of rows for type and subtype tables
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (tableView == self.typeTable)
        return self.types.count;
    else
        return subTypes.count;
    
}


//
//  return row text for type and subtype tables
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TypeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
    }

    if (tableView == self.typeTable)
        cell.textLabel.text = self.types[indexPath.row];
    else
        cell.textLabel.text = subTypes[indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    return  cell;
    
}

//
//  mark table cell
//
//  if type table then build the array of subtypes
//  if subtyps table then set value to return to caller
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
    if (tableView == self.typeTable) {
        
        //
        //  use the current type to build a list of subtypes for the second table
        //
        subTypes = [[NSMutableArray alloc] init];
        NSString* type = self.types[indexPath.row];
        [subTypes addObject:[NSString stringWithFormat:@"micro-%@", type]];
        [subTypes addObject:[NSString stringWithFormat:@"milli-%@", type]];
        [subTypes addObject:[NSString stringWithFormat:@"%@", type]];
        [subTypes addObject:[NSString stringWithFormat:@"kilo-%@", type]];
        [subTypes addObject:[NSString stringWithFormat:@"mega-%@", type]];
        [self.subtypeTable reloadData];
        
        NSIndexPath *sindexPath = [NSIndexPath indexPathForRow:2 inSection:0];
        UITableViewCell* scell = [self.subtypeTable cellForRowAtIndexPath:sindexPath];
        scell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.subtypeTable selectRowAtIndexPath:sindexPath animated:YES  scrollPosition:UITableViewScrollPositionBottom];
        
        subTypeFactors = @[@0.000001, @0.001, @1.0, @1000.0, @1000000.0];
        
    }
    
    else {
        
        //
        //  a subtype was selected so build the value
        //
        
    }
    
}


//
//  remove check on cell
//
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    
}


//
//  return the value to the caller
//
-(IBAction)okButtonClicked:(id)sender{
    
    self.ohmValue = [[OhmValue alloc] init];
    
    NSIndexPath *tindex = [self.typeTable indexPathForSelectedRow];
    NSIndexPath *sindex = [self.subtypeTable indexPathForSelectedRow];
    
    self.ohmValue.baseValue = [self.inputValue.text floatValue];
    
    self.ohmValue.type = self.types[tindex.row];
    
    self.ohmValue.subtype = subTypes[sindex.row];
    self.ohmValue.multiplier = [subTypeFactors[sindex.row] integerValue];
    self.ohmValue.trueValue = self.ohmValue.baseValue * self.ohmValue.multiplier;
    
}


-(IBAction)cancelButtonClicked:(id)sender{
    
    self.ohmValue = nil;
    
}





@end
