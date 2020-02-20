//
//  QuizResultsViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-03.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuizResultsViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *scoreArray;
@property (strong, nonatomic) NSNumber *quizScore;
@property (strong, nonatomic) NSDate *quizDate;
@property (nonatomic) bool riskAlert;

#pragma mark - IB Outlets
// Buttons
@property (strong, nonatomic) IBOutlet UIButton *homeButton;
@property (strong, nonatomic) IBOutlet UIButton *researchButton;

// Labels
@property (strong, nonatomic) IBOutlet UILabel *riskAlertLabel;
@property (strong, nonatomic) IBOutlet UILabel *infoLabel;
@property (strong, nonatomic) IBOutlet UILabel *highRiskLabel;


#pragma mark - IB Actions
- (IBAction)homeButtonPressed:(UIButton *)sender;
- (IBAction)researchButtonPressed:(UIButton *)sender;


@end

NS_ASSUME_NONNULL_END
