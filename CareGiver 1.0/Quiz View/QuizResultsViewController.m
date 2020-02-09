//
//  QuizResultsViewController.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-03.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import "QuizResultsViewController.h"
#import "ResearchTableViewController.h"

@interface QuizResultsViewController ()

@end

@implementation QuizResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Hide back button to prevent modification of quiz.
    self.navigationItem.hidesBackButton = true;
    self.navigationItem.title = @"Results Summary";
    
    #pragma mark - Quiz Result Filter
        // Conditional alert for high self harm risk
        if (self.riskAlert) {
            //self.riskInfoLabel.text = @"We care about you. We noticed you have thoughts of self harm very frequently. You shouldn't have to feel this way. There are several resources that can help you. \n \nSuicide hotline number: \n \nOther resources.";
        }

        if (self.quizScore.integerValue < 7) {
            // Depression Severity: None-minimal

        }
        else if (7 <= self.quizScore.integerValue && self.quizScore.integerValue < 14) {
            // Depression Severity: Mild

        }
        else if (14 <= self.quizScore.integerValue && self.quizScore.integerValue < 21) {
            // Depression Severity: Moderate

        }
        else if (21 <= self.quizScore.integerValue && self.quizScore.integerValue  < 28) {
            // Depression Severity: Moderately Severe

        }
        else {
            // Depression Severity: Severe

        }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)homeButtonPressed:(UIButton *)sender {
}

- (IBAction)researchButtonPressed:(UIButton *)sender {
}
@end
