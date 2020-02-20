//
//  QuizViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-01-14.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuizViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *scoreArray;
@property (strong, nonatomic) NSDate *quizDate;
@property (strong, nonatomic) NSNumber *quizScore;
@property (strong, nonatomic) NSArray *aggregateWeights;

@property (nonatomic) NSInteger questionCount;
@property (nonatomic) bool riskAlert;

#pragma mark - IBOutlets
// Not Buttons
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UILabel *buttonPromptLabel;
@property (strong, nonatomic) IBOutlet UILabel *questionNumberLabel;
@property (strong, nonatomic) IBOutlet UIImageView *buttonDividerImage;
@property (strong, nonatomic) IBOutlet UILabel *riskInfoLabel;

// Buttons
@property (strong, nonatomic) IBOutlet UIButton *button0;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) IBOutlet UIButton *questionBackButton;
@property (strong, nonatomic) IBOutlet UIButton *questionNextButton;

	
#pragma mark - IBActions

- (IBAction)button0Pressed:(UIButton *)sender;
- (IBAction)button1Pressed:(UIButton *)sender;
- (IBAction)button2Pressed:(UIButton *)sender;
- (IBAction)button3Pressed:(UIButton *)sender;
- (IBAction)submitButtonPressed:(UIButton *)sender;
- (IBAction)questionBackButtonPressed:(UIButton *)sender;
- (IBAction)questionNextButtonPressed:(UIButton *)sender;
- (IBAction)startButtonPressed:(UIButton *)sender;

#pragma mark - Functions
- (void)combineQuizData:(NSMutableArray *)quizScoreArray totalQuizScore:(NSNumber *)quizScore dateOfQuiz:(NSString *)quizDate isAtRisk:(BOOL)riskAlert;

- (NSMutableArray *)calculateAggregate:(NSMutableArray *)scoreArrayArray scoreArray:(NSMutableArray *)scoreArray aggregateScore:(NSMutableArray *)aggregateScore;


@end

NS_ASSUME_NONNULL_END
