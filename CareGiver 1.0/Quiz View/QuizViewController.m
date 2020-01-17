//
//  QuizViewController.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-01-14.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//
/*
 This class is meant to be a quiz implementation of PHQ-9 using a single view UIViewControler
*/

#import "QuizViewController.h"
#import "PHQ9QuizInfo.h"
#import "UserInformation.h"

@interface QuizViewController ()

@end

@implementation QuizViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Hide unnecessary objects
    // Hide Buttons
    self.questionBackButton.hidden = true;
    self.questionNextButton.hidden = true;
    self.submitButton.hidden = true;
    self.button0.hidden = true;
    self.button1.hidden = true;
    self.button2.hidden = true;
    self.button3.hidden = true;
    // Hide Labels and Images
    self.buttonDividerImage.hidden = true;
    self.questionNumberLabel.hidden = true;
    self.riskInfoLabel.hidden = true;
    
    // Set initial label values
    self.buttonPromptLabel.text = @"Press 'Start' to begin the questionaire.";
    self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizTitle;
    
    // Initialize question counter
    self.questionCount = 0;
    
    // Quiz Date info
    NSLocale* currentLocale = [NSLocale currentLocale];
    self.quizDate = [[NSDate date] descriptionWithLocale:currentLocale];
    
    // Initialize Quiz Scores
    self.quizScore = [NSNumber numberWithInteger:0];
    self.scoreArray = [[NSMutableArray alloc] initWithObjects: @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)button0Pressed:(UIButton *)sender {
    if (self.questionCount > 11) {
        // Do Hides and Unhides
        // Hides
        self.button0.hidden = true;
        self.button1.hidden = true;
        self.button2.hidden = true;
        self.button3.hidden = true;
        self.questionNextButton.hidden = true;
        self.buttonDividerImage.hidden = true;
        
        // Unhides
        self.submitButton.hidden = false;
        
        // Set Labels
        self.questionNumberLabel.text = @"That's all folks!";
        self.questionLabel.text = @"Thank you for completing the questionnaire. Press 'SUBMIT' to be matched to informational resources.";

    }
    else {
        // Record Question Answer Value
        self.scoreArray[self.questionCount] = @"0";
        
        // Increment question counter by 1
        self.questionCount++;
        
        // Update Label Texts
        self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
        self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld", self.questionCount + 1];
    }
}

- (IBAction)button1Pressed:(UIButton *)sender {
    
}

- (IBAction)button2Pressed:(UIButton *)sender {
}

- (IBAction)button3Pressed:(UIButton *)sender {
}

- (IBAction)submitButtonPressed:(UIButton *)sender {
    
    // Conditional alert for high self harm risk
    if ([self.scoreArray[11] isEqual: @"3"]) {
        
        [self.questionLabel.text stringByAppendingString:@""];
    }
    
}

- (IBAction)questionBackButtonPressed:(UIButton *)sender {
    if (self.questionCount == 0) {
        // Hide Buttons
        self.questionNextButton.hidden = true;
        self.questionBackButton.hidden = false;
        self.submitButton.hidden = false;
        self.button0.hidden = true;
        self.button1.hidden = true;
        self.button2.hidden = true;
        self.button3.hidden = true;
        // Hide Labels and Images
        self.buttonDividerImage.hidden = true;
        self.questionNumberLabel.hidden = true;
        
        // Unhide necessary objects
        self.buttonPromptLabel.hidden = false;
        self.startButton.hidden = false;
        
        
        // Set initial label values
        self.buttonPromptLabel.text = @"Press 'Start' to begin the questionaire.";
        self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizTitle;
    }
    else {
        // Decrement question counter by 1
        self.questionCount--;
        
        // Update Label Texts
        self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
        self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld", self.questionCount + 1];
    }
}

- (IBAction)questionNextButtonPressed:(UIButton *)sender {
}

- (IBAction)startButtonPressed:(UIButton *)sender {
    // Unhide Buttons
    self.questionBackButton.hidden = false;
    self.button0.hidden = false;
    self.button1.hidden = false;
    self.button2.hidden = false;
    self.button3.hidden = false;
    // Unhide Labels and Images
    self.buttonDividerImage.hidden = false;
    self.questionNumberLabel.hidden = false;
    
    // Hide unnecessary objects
    self.buttonPromptLabel.hidden = true;
    self.startButton.hidden = true;
    
    // Set question number label
    self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld", self.questionCount + 1];
    // Set main body of text to actual question
    self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
    
}
@end
