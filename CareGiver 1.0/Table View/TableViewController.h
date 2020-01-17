//
//  TableViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2019-11-27.
//  Copyright © 2019 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController

@property (strong, nonatomic) QuizTableViewCell *myCell;

#pragma mark - Get selected cell row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
