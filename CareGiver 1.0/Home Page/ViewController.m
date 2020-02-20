//
//  ViewController.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2019-12-19.
//  Copyright © 2019 Atlas Life Systems. All rights reserved.
//

#import "ViewController.h"
#import "UserInformation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Deterimine Time since last quiz
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger daysSinceLastQuiz = [gregorian component:NSCalendarUnitDay fromDate:[UserInformation sharedInstance].quizDateTime.lastObject];
    
    // Conditional to prevent quiz from being taken more than once every two weeks
    if ([UserInformation sharedInstance].quizTaken && daysSinceLastQuiz >= 14) {
        self.quizButton.hidden = true; // Hide quiz button so it can't be taken
    }
    else {
        self.quizButton.hidden = false;
    }
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)quizButtonPressed:(UIButton *)sender {
}

- (IBAction)quizAnalyticsButtonPressed:(UIButton *)sender {
}

- (IBAction)userInfoButtonPressed:(UIButton *)sender {
}

- (IBAction)favouritesButtonPressed:(UIButton *)sender {
}
- (IBAction)smileyButtonPressed:(UIButton *)sender {
}

- (IBAction)mehButtonPressed:(UIButton *)sender {
}

- (IBAction)frownyButtonPressed:(UIButton *)sender {
}
@end
