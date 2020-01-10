//
//  UserInformationViewController.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-01-07.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import "UserInformationViewController.h"

@interface UserInformationViewController ()

@end

@implementation UserInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark - Intial Hides
    // Hide Labels on Load
    self.nameLabel.hidden = true;
    self.ageLabel.hidden = true;
    self.dateOfBirthLabel.hidden = true;
    self.heightLabel.hidden = true;
    self.weightLabel.hidden = true;
    self.sexLabel.hidden = true;
    self.genderLabel.hidden = true;
    
    // Hide Headers on Load
    self.nameHeader.hidden = true;
    self.ageHeader.hidden = true;
    self.dateOfBirthHeader.hidden = true;
    self.heightHeader.hidden = true;
    self.weightHeader.hidden = true;
    self.sexHeader.hidden = true;
    self.genderHeader.hidden = true;
    
    // Hide Edit Button
    self.editInfoButton.hidden = true;
    
#pragma mark - NSDictionary for User's Personal Information
    // Initialie dictionary
    //NSMutableDictionary *userInformation = [[NSMutableDictionary alloc] init];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Button Functions
- (IBAction)userInfoSubmitButtonPressed:(UIButton *)sender {
    // Update Label Fields Text with Text Field Text
    self.nameLabel.text = [NSString stringWithFormat:@"%@/%@/%@", self.lastNameTextField.text, @" ", self.firstNameTextField.text];
    self.ageLabel.text = self.ageTextField.text;
    self.dateOfBirthLabel.text = self.dateOfBirthTextField.text;
    self.heightLabel.text = self.heightTextField.text;
    self.weightLabel.text = self.weightTextField.text;
    self.sexTextField.text = self.sexTextField.text;
    self.genderLabel.text = self.genderTextField.text;
    
    // Hide textfields/ submit button & show headers/ labels/ edit button
    // Labels/ Edit Button 
    self.nameLabel.hidden = false;
    self.ageLabel.hidden = false;
    self.dateOfBirthLabel.hidden = false;
    self.heightLabel.hidden = false;
    self.weightLabel.hidden = false;
    self.sexLabel.hidden = false;
    self.genderLabel.hidden = false;
    self.editInfoButton.hidden = false;
    
    // Headers
    self.nameHeader.hidden = false;
    self.ageHeader.hidden = false;
    self.dateOfBirthHeader.hidden = false;
    self.heightLabel.hidden = false;
    self.weightHeader.hidden = false;
    self.sexHeader.hidden = false;
    self.genderHeader.hidden = false;
    
    // Textfields/ Submit Button
    self.lastNameTextField.hidden = true;
    self.firstNameTextField.hidden = true;
    self.ageTextField.hidden = true;
    self.dateOfBirthTextField.hidden = true;
    self.heightTextField.hidden = true;
    self.weightTextField.hidden = true;
    self.sexTextField.hidden = true;
    self.genderTextField.hidden = true;
    self.userInfoSubmitButton.hidden = true;
    self.promptHeader.hidden = true;

}

- (IBAction)editInfoButtonsPressed:(UIButton *)sender {
    // Unhide textfields/ submit button & hide headers/ labels/ edit button
    // Labels/ Edit Button
    self.nameLabel.hidden = true;
    self.ageLabel.hidden = true;
    self.dateOfBirthLabel.hidden = true;
    self.heightLabel.hidden = true;
    self.weightLabel.hidden = true;
    self.sexLabel.hidden = true;
    self.genderLabel.hidden = true;
    self.editInfoButton.hidden = true;
    
    // Headers
    self.nameHeader.hidden = true;
    self.ageHeader.hidden = true;
    self.dateOfBirthHeader.hidden = true;
    self.heightLabel.hidden = true;
    self.weightHeader.hidden = true;
    self.sexHeader.hidden = true;
    self.genderHeader.hidden = true;
    
    // Text Fields/ Submit Button
    self.lastNameTextField.hidden = false;
    self.firstNameTextField.hidden = false;
    self.ageTextField.hidden = false;
    self.dateOfBirthTextField.hidden = false;
    self.heightTextField.hidden = false;
    self.weightTextField.hidden = false;
    self.sexTextField.hidden = false;
    self.genderTextField.hidden = false;
    self.userInfoSubmitButton.hidden = false;
    self.promptHeader.hidden = false;
}
@end
