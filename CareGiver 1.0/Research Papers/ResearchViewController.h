//
//  ResearchViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-09.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LabSummary.h"

NS_ASSUME_NONNULL_BEGIN

@interface ResearchViewController : UIViewController

@property (strong, nonatomic) LabSummary *labData;

#pragma mark - IBOutlets
// Text Views
@property (strong, nonatomic) IBOutlet UITextView *titleTextView;
@property (strong, nonatomic) IBOutlet UITextView *authorsTextView;
@property (strong, nonatomic) IBOutlet UITextView *keywordsTextView;
@property (strong, nonatomic) IBOutlet UITextView *summaryTextView;
@property (strong, nonatomic) IBOutlet UITextView *wellnessTaskTextView;
@property (strong, nonatomic) IBOutlet UITextView *otherFindingsTextView;
@property (strong, nonatomic) IBOutlet UITextView *limitationsTextView;
@property (strong, nonatomic) IBOutlet UITextView *subjectGroupTextView;

// Buttons
@property (strong, nonatomic) IBOutlet UIButton *citationButton;

#pragma mark - IBActions

- (IBAction)citationButtonPressed:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
