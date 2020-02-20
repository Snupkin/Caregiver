//
//  ResearchTableViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-01-07.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "LabSummary.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResearchTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableDictionary *labDictionary;
@property (strong, nonatomic) NSMutableArray *labArray;
//@property (strong, nonatomic) LabSummary *currentLab;


- (NSMutableArray *)doubleBubbleSort:(NSMutableArray *)unsortedDataArray arrayToSort:(NSMutableArray *)arrayToSort;

@end

NS_ASSUME_NONNULL_END
