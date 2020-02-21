//
//  FavouriteResearchTableViewController.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-20.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import "FavouriteResearchTableViewController.h"
#import "UserInformation.h"
#import "LabSummary.h"
#import "ResearchViewController.h"

@interface FavouriteResearchTableViewController ()

@end

@implementation FavouriteResearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.labDictionary = [UserInformation sharedInstance].favouriteLabs;
    // Add labs to array
    for (id labKey in self.labDictionary) {
        [self.labArray addObject:[self.labDictionary objectForKey:labKey]];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.labDictionary.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavouriteTableCell" forIndexPath:indexPath];
    
    // Configure the cell...
#pragma mark - Labs
    LabSummary *rowLab = [self.labArray objectAtIndex:indexPath.row];
    cell.textLabel.text = rowLab.title;
    cell.textLabel.numberOfLines = 2;
    cell.detailTextLabel.numberOfLines = 2;
    cell.detailTextLabel.text = rowLab.summary;
    cell.imageView.contentMode = 0;
    // Configure image color
    if ([rowLab.symptoms[0] integerValue] == 3) {
        cell.backgroundColor = [UIColor colorWithRed:132.0f/255.0f green:92.0f/255.0f blue:54.0f/255.0f alpha:1.0f];
    }
    else if ([rowLab.symptoms[1] integerValue] == 3) {
        cell.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1.0f];
    }
    else if ([rowLab.symptoms[2] integerValue] == 3) {
        cell.backgroundColor = [UIColor colorWithRed:93.0f/255.0f green:177.0f/255.0f blue:209.0f/255.0f alpha:1.0f];
    }
    else if ([rowLab.symptoms[3] integerValue] == 3) {
        cell.backgroundColor = [UIColor lightGrayColor];
    }
    else if ([rowLab.symptoms[4] integerValue] == 3) {
        cell.backgroundColor = [UIColor colorWithRed:119.0f/255.0f green:221.0f/255.0f blue:119.0f/255.0f alpha:1.0f];
    }
    else if ([rowLab.symptoms[5] integerValue] == 3) {
        cell.backgroundColor = [UIColor colorWithRed:241.0f/255.0f green:196.0f/255.0f blue:112.0f/255.0f alpha:1.0f];
    }
    else if ([rowLab.symptoms[6] integerValue] == 3) {
        cell.backgroundColor = [UIColor colorWithRed:253.0f/255.0f green:253.0f/255.0f blue:152.0f/255.0f alpha:1.0f];
    }
    else if ([rowLab.symptoms[7] integerValue] == 3) {
        cell.backgroundColor = [UIColor colorWithRed:249.0f/255.0f green:102.0f/255.0f blue:94.0f/255.0f alpha:1.0f];
    }
    else {
        cell.backgroundColor = [UIColor colorWithRed:178.0f/255.0f green:157.0f/255.0f blue:217.0f/255.0f alpha:1.0f];
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass:[ResearchViewController class]]) {
            ResearchViewController *researchVC = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender]; // Get path for cell
            researchVC.labData = [self.labArray objectAtIndex:path.row]; // path.row is row for cell
            researchVC.labDictionary = self.labDictionary;
        }
    }
}


@end
