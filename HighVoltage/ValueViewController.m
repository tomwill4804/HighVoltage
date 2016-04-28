//
//  ValueViewController.m
//  HighVoltage
//
//  Created by Tom Williamson on 4/28/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "ValueViewController.h"

@interface ValueViewController ()

@end

@implementation ValueViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.types.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"leftCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = self.types[indexPath.row];
    return  cell;
    
}


@end
