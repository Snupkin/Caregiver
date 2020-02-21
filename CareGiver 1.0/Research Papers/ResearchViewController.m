//
//  ResearchViewController.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-09.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import "ResearchViewController.h"
#import "CitationsViewController.h"
#import "UserInformation.h"
#import "SymptomResearchListTableViewController.h"

@interface ResearchViewController ()

@end

@implementation ResearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#pragma mark - Lab Data Formatting
    // Combine string arrays
    NSString *authors = [self.labData.authors componentsJoinedByString:@", "];
    NSString *keywords = [self.labData.keywords componentsJoinedByString:@", "];
    NSString *otherFindingsList = [self.labData.otherFindings componentsJoinedByString:@", "];
    NSString *limitationsList = [self.labData.limitations componentsJoinedByString:@", "];
    NSString *subjectGroupsList = [self.labData.subjectGroup componentsJoinedByString:@", "];
    
    // Add headers to bullet point sections
    NSString *otherFindingsHeader = @"Other Findings:\n, ";
    NSString *limitationsHeader = @"Limitations:\n, ";
    NSString *subjectGroupsHeader = @"Subject Group:\n, ";
    
    NSString *otherFindings = [otherFindingsHeader stringByAppendingString:otherFindingsList];
    NSString *limitations = [limitationsHeader stringByAppendingString:limitationsList];
    NSString *subjectGroups = [subjectGroupsHeader stringByAppendingString:subjectGroupsList];
    
    // Format bullet point strings
    NSString *bpOtherFindings = [otherFindings stringByReplacingOccurrencesOfString:@", " withString:@"\n\u2022 "];
    NSString *bpLimitations = [limitations stringByReplacingOccurrencesOfString:@", " withString:@"\n\u2022 "];
    NSString *bpSubjectGroups = [subjectGroups stringByReplacingOccurrencesOfString:@", " withString:@"\n\u2022 "];

    // Disable text editing for TextViews
    self.titleTextView.editable = false;
    self.authorsTextView.editable = false;
    self.keywordsTextView.editable = false;
    self.summaryTextView.editable = false;
    self.wellnessTaskTextView.editable = false;
    self.otherFindingsTextView.editable = false;
    self.limitationsTextView.editable = false;
    self.subjectGroupTextView.editable = false;
    
    // Set Labels
    self.titleTextView.text = self.labData.title;
    self.authorsTextView.text = authors;
    self.keywordsTextView.text = keywords;
    self.summaryTextView.text = self.labData.summary;
    self.wellnessTaskTextView.text = self.labData.wellnessTask;
    if (self.labData.otherFindings.count >= 1) {
        self.otherFindingsTextView.text = bpOtherFindings;
    }
    else {
        self.otherFindingsTextView.text = @"There are no significant other findings.";
    }
    if (self.labData.limitations.count >= 1) {
        self.limitationsTextView.text = bpLimitations;
    }
    else {
        self.limitationsTextView.text = @"No significant limitations were found.";
    }
    self.subjectGroupTextView.text = bpSubjectGroups;
    
    // Favourite Button Text
    if (self.labData.favourited) {
        [self.favouriteButton setTitle:@"Unfavourite" forState:UIControlStateNormal];
    }
    else {
        [self.favouriteButton setTitle:@"Favourite" forState:UIControlStateNormal];
    }
    
    // Set color marker
    if ([self.labData.symptoms[0] integerValue] == 3) { 
        self.colorImage.image = [UIImage imageNamed:@"brown.jpg"];
    }
    else if ([self.labData.symptoms[1] integerValue] == 3) {
        self.colorImage.image = [UIImage imageNamed:@"pink.jpg"];
    }
    else if ([self.labData.symptoms[2] integerValue] == 3) {
        self.colorImage.image = [UIImage imageNamed:@"blue.jpg"];
    }
    else if ([self.labData.symptoms[3] integerValue] == 3) {
        self.colorImage.image = [UIImage imageNamed:@"grey.jpg"];
    }
    else if ([self.labData.symptoms[4] integerValue] == 3) {
        self.colorImage.image = [UIImage imageNamed:@"green.jpg"];
    }
    else if ([self.labData.symptoms[5] integerValue] == 3) {
        self.colorImage.image = [UIImage imageNamed:@"orange.jpg"];
    }
    else if ([self.labData.symptoms[6] integerValue] == 3) {
        self.colorImage.image = [UIImage imageNamed:@"yellow.jpg"];
    }
    else if ([self.labData.symptoms[7] integerValue] == 3) {
        self.colorImage.image = [UIImage imageNamed:@"red.jpg"];
    }
    else {
        self.colorImage.image = [UIImage imageNamed:@"purple.jpg"];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UIButton class]]) {
        if ([segue.destinationViewController isKindOfClass:[CitationsViewController class]]) {
            CitationsViewController *citationsVC = segue.destinationViewController;
            citationsVC.citations = self.labData.citations;
        }
        if ([sender isKindOfClass:[UIButton class]]) {
            if ([segue.destinationViewController isKindOfClass:[SymptomResearchListTableViewController class]]) {
                SymptomResearchListTableViewController *SRLTVC = segue.destinationViewController;
                SRLTVC.labDictionary = self.labDictionary;
                SRLTVC.previousLab = self.labData;
            }
        }
    }
}

#pragma mark - Button Functionality

- (IBAction)citationButtonPressed:(UIButton *)sender {
}

- (IBAction)favouriteButtonPressed:(UIButton *)sender {
    if (!self.labData.favourited) {
        [[UserInformation sharedInstance].favouriteLabs setObject:self.labData forKey:self.labData.title];
        self.labData.favourited = YES;
        // Update lab Dictionary
        [self.labDictionary setObject:self.labData forKey:self.labData.title];
        // Update Button Text
        [self.favouriteButton setTitle:@"Unfavourite" forState:UIControlStateNormal];
    }
    else {
        [[UserInformation sharedInstance].favouriteLabs removeObjectForKey:self.labData.title];
        self.labData.favourited = NO;
        // Update lab Dictionary
        [self.labDictionary setObject:self.labData forKey:self.labData.title];
        [self.favouriteButton setTitle:@"Favourite" forState:UIControlStateNormal];

    }
}

- (IBAction)listButtonPressed:(UIButton *)sender {
}
@end
