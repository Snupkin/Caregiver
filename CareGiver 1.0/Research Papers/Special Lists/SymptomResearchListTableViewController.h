//
//  SymptomResearchListTableViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-20.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabSummary.h"

NS_ASSUME_NONNULL_BEGIN

@interface SymptomResearchListTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableDictionary *labDictionary;
@property (strong, nonatomic) NSMutableArray *labArray;
@property (strong, nonatomic) LabSummary *previousLab;

@end

NS_ASSUME_NONNULL_END
