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
    if (self.riskAlert || self.quizScore.integerValue >= 20) {
        self.riskAlertLabel.text = @"We noticed you received a high score on the PHQ-9. Below is a list of resources for support.";
        self.infoLabel.text = @"Phone Resources (Available 24/7/365):\nCrisis Services Canada - 1(833)-456-4566 or Text \"Start\" to 45645 (4pm to 12am ET)\nEmergency Services - 911\nKids Help Phone - 1(800)-668-6868 or Text \"Connect\" to 686868 or Access Online Chat at https://kidshelpphone.ca/live-chat/\nTelehealth Ontario (talk with a nurse) - 1(866)-797-0000\n\nHospitals:\nNorth York General - 4001 Leslie Ave (416)-756-7000\nSunnybrook Emergency - 2075 Bayview Ave (416)-480-6100" ;
        self.highRiskLabel.text = @"If you need Urgent medical or psychiatric attention please visit the closest emergency room";
    }
    else {
        self.riskAlertLabel.text = @"Below is a list of resources for support.";
        self.infoLabel.text = @"Phone Resources (Available 24/7/365):\nCrisis Services Canada - 1(833)-456-4566 or Text \"Start\" to 45645 (4pm to 12am ET)\nEmergency Services - 911\nKids Help Phone - 1(800)-668-6868 or Text \"Connect\" to 686868 or Access Online Chat at https://kidshelpphone.ca/live-chat/\nTelehealth Ontario (talk with a nurse) - 1(866)-797-0000\n\nHospitals:\n North York General - 4001 Leslie Ave (416)-756-7000\nSunnybrook Emergency - 2075 Bayview Ave (416)-480-6100" ;
        self.highRiskLabel.text = @"If you need urgent medical or psychiatric attention please visit the closest emergency room";
    }

//        if (self.quizScore.integerValue < 5) {
//            // Depression Severity: None-minimal
//
//        }
//        else if (5 <= self.quizScore.integerValue && self.quizScore.integerValue < 10) {
//            // Depression Severity: Mild
//
//        }
//        else if (10 <= self.quizScore.integerValue && self.quizScore.integerValue < 15) {
//            // Depression Severity: Moderate
//
//        }
//        else if (15 <= self.quizScore.integerValue && self.quizScore.integerValue  < 20) {
//            // Depression Severity: Moderately Severe
//
//        }
//    else {
//        // Depression Severity: Severe
//
//    }
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
