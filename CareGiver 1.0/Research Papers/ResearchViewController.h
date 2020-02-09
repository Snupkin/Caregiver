//
//  ResearchViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-09.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResearchViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *labArray;

#pragma mark - IBOutlets
// Labels
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *authorLabel;
@property (strong, nonatomic) IBOutlet UILabel *keywordLabel;
@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *otherFindingsLabel;
@property (strong, nonatomic) IBOutlet UILabel *wellnessTaskLabel;
@property (strong, nonatomic) IBOutlet UILabel *limitationsLabel;
@property (strong, nonatomic) IBOutlet UILabel *subjectGroupLabel;

// Buttons
@property (strong, nonatomic) IBOutlet UIButton *citationButton;

#pragma mark - IBActions

- (IBAction)citationButtonPressed:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
