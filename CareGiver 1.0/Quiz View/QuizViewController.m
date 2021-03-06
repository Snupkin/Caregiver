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
#import "QuizResultsViewController.h"

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
    self.startButton.hidden = false;
    
    self.button0.hidden = true;
    self.button1.hidden = true;
    self.button2.hidden = true;
    self.button3.hidden = true;
    
    // Hide Labels and Images
    self.riskInfoLabel.hidden = true;
    self.buttonDividerImage.hidden = true;
    self.questionNumberLabel.hidden = true;
    self.disclaimerLabel.hidden = false;
    
    // Set initial label values
    self.buttonPromptLabel.text = @"Press 'Start' to begin the questionaire.";
    self.questionLabel.text = @"This questionnaire will help our system connect you with the most relevant data to help you in achieving your wellness goals. \n \nPlease answer the following 9 questions as accurately as possible.";
    self.disclaimerLabel.text = @"The medical informatin on this site is provided as an information resource only and is not to be used or relied on for any diagnostic or treatment purposes. This information does not create any patient-physician relationship and should not be used as a substitute for professional diagnosis and treatment. \n\nPlease consult a health care professional before making any health care decisions for guidance about a specific medical condition. \n\nBy starting the quiz you agree with this disclaimer.";

    // Initialize question counter & quiz score & riskAlert
    self.questionCount = 0;
    self.riskAlert = NO;
    
    // Quiz Date info
    self.quizDate = [NSDate date];
    
    // Initialize Quiz Scores
    self.quizScore = [NSNumber numberWithInteger:0];
    // Initialize scoreArray with 0's
    self.scoreArray = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], [NSNumber numberWithInteger:0], nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([sender isKindOfClass:[UIButton class]]) {
        if ([segue.destinationViewController isKindOfClass:[QuizResultsViewController class]]) {
            QuizResultsViewController *quizRVC = segue.destinationViewController;
            // Determine passed values
            quizRVC.quizScore = self.quizScore;
            quizRVC.quizDate = self.quizDate;
            quizRVC.scoreArray = self.scoreArray;
            quizRVC.riskAlert = self.riskAlert;
        }
    }
}

#pragma mark - Start/Submit Buttons

- (IBAction)startButtonPressed:(UIButton *)sender {
    // Unhide Buttons
    self.questionNextButton.hidden = false;
    self.questionBackButton.hidden = false;
    self.button0.hidden = false;
    self.button1.hidden = false;
    self.button2.hidden = false;
    self.button3.hidden = false;
    // Unhide Labels and Images
    self.buttonDividerImage.hidden = false;
    self.questionNumberLabel.hidden = false;
    
    // Hide unnecessary objects
    self.riskInfoLabel.hidden = false;
    self.buttonPromptLabel.hidden = true;
    self.startButton.hidden = true;
    self.disclaimerLabel.hidden = true;
    
    // Set question number label
    self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld:", self.questionCount + 1];
    // Set main body of text to actual question
    self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
    self.riskInfoLabel.textColor = [UIColor darkGrayColor];
    self.riskInfoLabel.text = @"How often has this bothered you over the past 2 weeks?";
}

- (IBAction)submitButtonPressed:(UIButton *)sender {
    // Sum up individual question scores
    self.quizScore = [self.scoreArray valueForKeyPath:@"@sum.self"];
    NSLog(@"Quiz Score: %@", self.quizScore);
    // Store quiz score info
    [[UserInformation sharedInstance].scoreArrayArray addObject:self.scoreArray];
    [[UserInformation sharedInstance].quizDateTime addObject:self.quizDate];
    [UserInformation sharedInstance].quizTaken = YES; // Flag that quiz was taken
    
    // Calculate aggregate score
    

    
    // Send information to server
}

#pragma mark - Quiz Answer Buttons

- (IBAction)button0Pressed:(UIButton *)sender {
    // Condition if on last quiz question: Prepare for submit page
    if (self.questionCount >= (self.scoreArray.count - 1)) {
        // Record Question Answer Value
        self.scoreArray[self.questionCount] = [NSNumber numberWithInteger:1];
        NSLog(@"The score for question %ld is %@", self.questionCount + 1, self.scoreArray[self.questionCount]);
        
        // Update Risk Alert
        self.riskAlert = NO;
        [UserInformation sharedInstance].riskAlert = self.riskAlert;
        
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
        self.riskInfoLabel.hidden = false;
        self.questionNumberLabel.text = @"That's all folks!";
        self.riskInfoLabel.text = @"Thank you for completing the questionnaire. Please review your answers below. Press 'SUBMIT' to continue.";
        // Show Quiz Result Summary
        self.questionLabel.textAlignment = NSTextAlignmentJustified;
        self.questionLabel.text = [NSString stringWithFormat:@"Question 1 (Lack of pleasure): %@ \nQuestion 2 (Depressive mood): %@  \nQuestion 3 (Insomnia/Hypersomnia): %@  \nQuestion 4 (Feeling tired): %@  \nQuestion 5 (Overeating/Undereating): %@  \nQuestion 6 (Feeling down/worthlessness): %@  \nQuestion 7 (Difficulty concentrating): %@  \nQuestion 8 (Can't hold still/Move so slow): %@  \nQuestion 9 (Suicide/Self harm): %@", self.scoreArray[0], self.scoreArray[1], self.scoreArray[2], self.scoreArray[3], self.scoreArray[4], self.scoreArray[5], self.scoreArray[6], self.scoreArray[7], self.scoreArray[8]];
    }
    else {
        // Record Question Answer Value
        self.scoreArray[self.questionCount] = [NSNumber numberWithInteger:0];
        NSLog(@"The score for question %ld is %@", self.questionCount + 1, self.scoreArray[self.questionCount]);
        
        // Increment question counter by 1
        self.questionCount++;
        
        // Update Label Texts
        self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
        self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld:", self.questionCount + 1];
    }
}

- (IBAction)button1Pressed:(UIButton *)sender {
    if (self.questionCount >= (self.scoreArray.count - 1)) {
        // Record Question Answer Value
        self.scoreArray[self.questionCount] = [NSNumber numberWithInteger:1];
        NSLog(@"The score for question %ld is %@", self.questionCount + 1, self.scoreArray[self.questionCount]);
        
        // Update Risk Alert
        self.riskAlert = NO;
        [UserInformation sharedInstance].riskAlert = self.riskAlert;
        
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
        self.riskInfoLabel.hidden = false;
        self.questionNumberLabel.text = @"That's all folks!";
        self.riskInfoLabel.text = @"Thank you for completing the questionnaire. Please review your answers below. Press 'SUBMIT' to continue.";
        // Show Quiz Result Summary
        self.questionLabel.textAlignment = NSTextAlignmentJustified;
        self.questionLabel.text = [NSString stringWithFormat:@"Question 1 (Lack of pleasure): %@ \nQuestion 2 (Depressive mood): %@  \nQuestion 3 (Insomnia/Hypersomnia): %@  \nQuestion 4 (Feeling tired): %@  \nQuestion 5 (Overeating/Undereating): %@  \nQuestion 6 (Feeling down/worthlessness): %@  \nQuestion 7 (Difficulty concentrating): %@  \nQuestion 8 (Can't hold still/Move so slow): %@  \nQuestion 9 (Suicide/Self harm): %@", self.scoreArray[0], self.scoreArray[1], self.scoreArray[2], self.scoreArray[3], self.scoreArray[4], self.scoreArray[5], self.scoreArray[6], self.scoreArray[7], self.scoreArray[8]];
        
    }
    else {
        // Record Question Answer Value
        self.scoreArray[self.questionCount] = [NSNumber numberWithInteger:1];
        NSLog(@"The score for question %ld is %@", self.questionCount + 1, self.scoreArray[self.questionCount]);
        
        // Increment question counter by 1
        self.questionCount++;
        
        // Update Label Texts
        self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
        self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld:", self.questionCount + 1];
    }
}

- (IBAction)button2Pressed:(UIButton *)sender {
    if (self.questionCount >= (self.scoreArray.count - 1)) {
        // Record Question Answer Value
        self.scoreArray[self.questionCount] = [NSNumber numberWithInteger:1];
        NSLog(@"The score for question %ld is %@", self.questionCount + 1, self.scoreArray[self.questionCount]);
        
        // Update Risk Alert
        self.riskAlert = NO;
        [UserInformation sharedInstance].riskAlert = self.riskAlert;
        
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
        self.riskInfoLabel.hidden = false;
        self.questionNumberLabel.text = @"That's all folks!";
        self.riskInfoLabel.text = @"Thank you for completing the questionnaire. Please review your answers below. Press 'SUBMIT' to continue.";
        // Show Quiz Result Summary
        self.questionLabel.textAlignment = NSTextAlignmentJustified;
        self.questionLabel.text = [NSString stringWithFormat:@"Question 1 (Lack of pleasure): %@ \nQuestion 2 (Depressive mood): %@  \nQuestion 3 (Insomnia/Hypersomnia): %@  \nQuestion 4 (Feeling tired): %@  \nQuestion 5 (Overeating/Undereating): %@  \nQuestion 6 (Feeling down/worthlessness): %@  \nQuestion 7 (Difficulty concentrating): %@  \nQuestion 8 (Can't hold still/Move so slow): %@  \nQuestion 9 (Suicide/Self harm): %@", self.scoreArray[0], self.scoreArray[1], self.scoreArray[2], self.scoreArray[3], self.scoreArray[4], self.scoreArray[5], self.scoreArray[6], self.scoreArray[7], self.scoreArray[8]];
        
    }
    else {
        // Record Question Answer Value
        self.scoreArray[self.questionCount] = [NSNumber numberWithInteger:2];
        NSLog(@"The score for question %ld is %@", self.questionCount + 1, self.scoreArray[self.questionCount]);
        
        // Increment question counter by 1
        self.questionCount++;
        
        // Update Label Texts
        self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
        self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld:", self.questionCount + 1];
    }
}

- (IBAction)button3Pressed:(UIButton *)sender {
    if (self.questionCount >= (self.scoreArray.count - 1)) {
        // Record Question Answer Value
        self.scoreArray[self.questionCount] = [NSNumber numberWithInteger:3];
        NSLog(@"The score for question %ld is %@", self.questionCount + 1, self.scoreArray[self.questionCount]);
        
        // Update Risk Alert
        self.riskAlert = YES;
        [UserInformation sharedInstance].riskAlert = self.riskAlert;
        
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
        self.riskInfoLabel.hidden = false;
        self.questionNumberLabel.text = @"That's all folks!";
        self.riskInfoLabel.text = @"Thank you for completing the questionnaire. Please review your answers below. Press 'SUBMIT' to continue.";
        // Show Quiz Result Summary
        self.questionLabel.textAlignment = NSTextAlignmentJustified;
        self.questionLabel.text = [NSString stringWithFormat:@"Question 1 (Lack of pleasure): %@ \nQuestion 2 (Depressive mood): %@  \nQuestion 3 (Insomnia/Hypersomnia): %@  \nQuestion 4 (Feeling tired): %@  \nQuestion 5 (Overeating/Undereating): %@  \nQuestion 6 (Feeling down/worthlessness): %@  \nQuestion 7 (Difficulty concentrating): %@  \nQuestion 8 (Can't hold still/Move so slow): %@  \nQuestion 9 (Suicide/Self harm): %@", self.scoreArray[0], self.scoreArray[1], self.scoreArray[2], self.scoreArray[3], self.scoreArray[4], self.scoreArray[5], self.scoreArray[6], self.scoreArray[7], self.scoreArray[8]];
        
    }
    else {
        // Record Question Answer Value
        self.scoreArray[self.questionCount] = [NSNumber numberWithInteger:3];
        NSLog(@"The score for question %ld is %@", self.questionCount + 1, self.scoreArray[self.questionCount]);
        
        // Increment question counter by 1
        self.questionCount++;
        
        // Update Label Texts
        self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
        self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld:", self.questionCount + 1];
    }
}

#pragma mark - Back/Next Buttons

- (IBAction)questionBackButtonPressed:(UIButton *)sender {
    if (self.questionCount == 0) {
        // Hide Buttons
        self.questionNextButton.hidden = false;
        self.questionBackButton.hidden = true;
        self.startButton.hidden = true;
        self.submitButton.hidden = true;
        self.button0.hidden = true;
        self.button1.hidden = true;
        self.button2.hidden = true;
        self.button3.hidden = true;
        // Hide Labels and Images
        self.buttonDividerImage.hidden = true;
        self.questionNumberLabel.hidden = true;
        self.riskInfoLabel.hidden = true;

        // Text Alignment Fix
        self.questionLabel.textAlignment = NSTextAlignmentLeft;
        
        // Unhide necessary objects
        self.buttonPromptLabel.hidden = false;
        self.disclaimerLabel.hidden = false;
        
        // Set initial label values
        self.buttonPromptLabel.text = @"Press 'Next' to navigate the questionaire.";
        self.questionLabel.text = @"This questionnaire will help our system connect you with the most relevant data to help you in achieving your wellness goals. \n \nPlease answer the following 9 questions as accurately as possible.";
        self.disclaimerLabel.text = @"The medical informatin on this site is provided as an information resource only and is not to be used or relied on for any diagnostic or treatment purposes. This information does not create any patient-physician relationship and should not be used as a substitute for professional diagnosis and treatment. \n\nPlease consult a health care professional before making any health care decisions for guidance about a specific medical condition. \n\nBy starting the quiz you agree with this disclaimer.";
    }
    else {
        // Decrement question counter by 1
        self.questionCount--;
        
        // Update Label Texts
        self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
        self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld:", self.questionCount + 1];
//        self.riskInfoLabel.hidden = true;
    }
}

- (IBAction)questionNextButtonPressed:(UIButton *)sender {
    if (self.questionCount >= (self.scoreArray.count - 1)) {
        // Hide Buttons
        self.questionNextButton.hidden = true;
        self.questionBackButton.hidden = false;
        self.button0.hidden = true;
        self.button1.hidden = true;
        self.button2.hidden = true;
        self.button3.hidden = true;
        // Hide Labels and Images
        self.buttonDividerImage.hidden = true;
        self.questionNumberLabel.hidden = true;
        
        // Unhide necessary objects
        self.buttonPromptLabel.hidden = false;
        self.startButton.hidden = true;
        self.submitButton.hidden = false;
        
        // Set initial label values
        self.questionNumberLabel.text = @"That's all folks!";
        self.questionLabel.text = @"Thank you for completing the questionnaire. Press 'SUBMIT' to be matched to informational resources.";
    }
    else if (self.questionCount == 0 && self.buttonDividerImage.hidden) {
        // Essentially just the start button
        // Unhide Buttons
        self.questionNextButton.hidden = false;
        self.questionBackButton.hidden = false;
        self.button0.hidden = false;
        self.button1.hidden = false;
        self.button2.hidden = false;
        self.button3.hidden = false;
        // Unhide Labels and Images
        self.buttonDividerImage.hidden = false;
        self.questionNumberLabel.hidden = false;
        
        // Hide unnecessary objects
        self.riskInfoLabel.hidden = false;
        self.buttonPromptLabel.hidden = true;
        self.startButton.hidden = true;
        self.disclaimerLabel.hidden = true;
        
        // Set question number label
        self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld:", self.questionCount + 1];
        // Set main body of text to actual question
        self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
        self.riskInfoLabel.text = @"How often has this bothered you over the past 2 weeks?";
    }
    else {
        // Increment question counter by 1
        self.questionCount++;
        
        // Update Label Texts
        self.questionLabel.text = [PHQ9QuizInfo sharedInstance].quizQuestions[self.questionCount];
        self.questionNumberLabel.text = [NSString stringWithFormat: @"Question %ld", self.questionCount + 1];
//        self.riskInfoLabel.hidden = true;

    }
    
}

#pragma mark - Functions

- (void)combineQuizData:(NSMutableArray *)quizScoreArray totalQuizScore:(NSNumber *)quizScore dateOfQuiz:(NSString *)quizDate isAtRisk:(BOOL)riskAlert{
    // This function combines the score of the individual questions, the overall quiz score and the date the quiz was written into one "cell" in the array
    NSMutableArray *quizResults = [[NSMutableArray alloc] initWithObjects: quizScoreArray, quizScore, quizDate, riskAlert, nil];
    [[UserInformation sharedInstance].scoreArrayArray addObject: quizResults];
}

- (NSMutableArray *)calculateAggregate:(NSMutableArray *)scoreArrayArray scoreArray:(NSMutableArray *)scoreArray /*aggregateScore:(NSMutableArray *)aggregateScore*/ {
    NSMutableArray *aggregateScore = [[NSMutableArray alloc] initWithObjects:@0, @0, @0, @0, @0, @0, @0, @0, @0, nil]; // Init weighted array array
    NSInteger weightSum = 0;
    int i,j,k;
//    self.aggregateWeights = [NSArray arrayWithObjects:@"1", @"2", @"4", @"8", @"16", nil];
    // Calculate aggregate score
    for (i = 0; i < scoreArrayArray.count; i++) {
        for (j = 0; j < scoreArray.count; j++) {
            NSInteger weight = pow(2, i + 1); // Weight will be 2 to the power of index of score array array
            weightSum += weight;
            NSInteger score = [[scoreArray objectAtIndex:j] integerValue]; // Get score
            NSInteger weightedScoreVal = score * weight; // get weighted value of score
            
            [aggregateScore setObject:[NSNumber numberWithInteger:([[aggregateScore objectAtIndex:j] integerValue] + weightedScoreVal)] atIndexedSubscript:j];
        }
    }
    // Normalize Score Values
    for (k = 0; k < scoreArray.count; k++) {
        float weightedAverage = [[aggregateScore objectAtIndex:k] integerValue]/weightSum;
        [aggregateScore setObject:[NSNumber numberWithInteger:lroundf(weightedAverage)] atIndexedSubscript:k];
    }
    
    return aggregateScore;
}


@end
