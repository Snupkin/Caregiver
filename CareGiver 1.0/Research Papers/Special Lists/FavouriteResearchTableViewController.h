//
//  FavouriteResearchTableViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-20.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FavouriteResearchTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *labArray;
@property (strong, nonatomic) NSMutableDictionary *labDictionary;

@end

NS_ASSUME_NONNULL_END
