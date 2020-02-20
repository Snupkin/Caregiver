//
//  ViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2019-12-19.
//  Copyright © 2019 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController

#pragma mark - IB Outlets
// Footer Buttons
@property (strong, nonatomic) IBOutlet UIButton *quizButton;
@property (strong, nonatomic) IBOutlet UIButton *quizAnalyticsButton;
@property (strong, nonatomic) IBOutlet UIButton *userInfoButton;
@property (strong, nonatomic) IBOutlet UIButton *favouritesButton;


// Daily Quiz Buttons
//@property (strong, nonatomic) IBOutlet UIButton *smileyButton;
//@property (strong, nonatomic) IBOutlet UIButton *mehButton;
//@property (strong, nonatomic) IBOutlet UIButton *frownyButton;

// Background Image
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

#pragma mark - IB Actions
// PHQ-9 Action
- (IBAction)quizButtonPressed:(UIButton *)sender;
- (IBAction)quizAnalyticsButtonPressed:(UIButton *)sender;
- (IBAction)userInfoButtonPressed:(UIButton *)sender;
- (IBAction)favouritesButtonPressed:(UIButton *)sender;

// Daily Quiz Buttons
//- (IBAction)smileyButtonPressed:(UIButton *)sender;
//- (IBAction)mehButtonPressed:(UIButton *)sender;
//- (IBAction)frownyButtonPressed:(UIButton *)sender;



@end

NS_ASSUME_NONNULL_END
