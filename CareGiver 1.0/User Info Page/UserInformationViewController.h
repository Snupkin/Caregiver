//
//  UserInformationViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-01-07.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInformationViewController : UIViewController


#pragma mark - IB Outlets
//Background Image
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

// Buttons
@property (strong, nonatomic) IBOutlet UIButton *userInfoSubmitButton;
@property (strong, nonatomic) IBOutlet UIButton *editInfoButton;
@property (strong, nonatomic) IBOutlet UIButton *cancelEditButton;

// Label Fields
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateOfBirthLabel;
@property (strong, nonatomic) IBOutlet UILabel *heightLabel;
@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet UILabel *sexLabel;
@property (strong, nonatomic) IBOutlet UILabel *genderLabel;

// Label Headers
@property (strong, nonatomic) IBOutlet UILabel *promptHeader;
@property (strong, nonatomic) IBOutlet UILabel *nameHeader;
@property (strong, nonatomic) IBOutlet UILabel *ageHeader;
@property (strong, nonatomic) IBOutlet UILabel *dateOfBirthHeader;
@property (strong, nonatomic) IBOutlet UILabel *heightHeader;
@property (strong, nonatomic) IBOutlet UILabel *weightHeader;
@property (strong, nonatomic) IBOutlet UILabel *sexHeader;
@property (strong, nonatomic) IBOutlet UILabel *genderHeader;

// Text Fields
//@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
//@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *ageTextField;
@property (strong, nonatomic) IBOutlet UITextField *dateOfBirthTextField;
@property (strong, nonatomic) IBOutlet UITextField *heightTextField;
@property (strong, nonatomic) IBOutlet UITextField *weightTextField;
@property (strong, nonatomic) IBOutlet UITextField *sexTextField;
@property (strong, nonatomic) IBOutlet UITextField *genderTextField;



#pragma mark - IB Actions
// Buttons
- (IBAction)userInfoSubmitButtonPressed:(UIButton *)sender;
- (IBAction)editInfoButtonsPressed:(UIButton *)sender;
- (IBAction)cancelEditButtonPressed:(UIButton *)sender;



@end

NS_ASSUME_NONNULL_END
