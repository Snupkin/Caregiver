//
//  QuizTableViewCell.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2019-12-03.
//  Copyright © 2019 Atlas Life Systems. All rights reserved.
//

#import "QuizTableViewCell.h"
#import "TableViewController.h"
#import "UserInformation.h"
#import "PHQ9QuizInfo.h"

@implementation QuizTableViewCell

// Synthesize buttons/labels so they exist
@synthesize button1 = _button1;
@synthesize button2 = _button2;
@synthesize button3 = _button3;
@synthesize button4 = _button4;
@synthesize submitButton = _submitButton;
@synthesize quizLabel = _quizLabel;
@synthesize buttonDividerImage = _buttonDividerImage;


#pragma mark - Button Functions

// Upon button press it stores the value in an array.
- (IBAction)button1Pressed:(UIButton *)sender {
    [[PHQ9QuizInfo sharedInstance].scoreArray replaceObjectAtIndex:([PHQ9QuizInfo sharedInstance].lastClickedRow) withObject:@"0"];
    NSLog(@"Row %li Score: %@", [PHQ9QuizInfo sharedInstance].lastClickedRow, [PHQ9QuizInfo sharedInstance].scoreArray[[PHQ9QuizInfo sharedInstance].lastClickedRow]);
}

- (IBAction)button2Pressed:(UIButton *)sender {
    [[PHQ9QuizInfo sharedInstance].scoreArray replaceObjectAtIndex:([PHQ9QuizInfo sharedInstance].lastClickedRow) withObject:@"1"];
    NSLog(@"Row %li Score: %@", [PHQ9QuizInfo sharedInstance].lastClickedRow, [PHQ9QuizInfo sharedInstance].scoreArray[[PHQ9QuizInfo sharedInstance].lastClickedRow]);
}

- (IBAction)button3Pressed:(UIButton *)sender {
    [[PHQ9QuizInfo sharedInstance].scoreArray replaceObjectAtIndex:([PHQ9QuizInfo sharedInstance].lastClickedRow) withObject:@"2"];
    NSLog(@"Row %li Score: %@", [PHQ9QuizInfo sharedInstance].lastClickedRow, [PHQ9QuizInfo sharedInstance].scoreArray[[PHQ9QuizInfo sharedInstance].lastClickedRow]);
}

- (IBAction)button4Pressed:(UIButton *)sender {
    [[PHQ9QuizInfo sharedInstance].scoreArray replaceObjectAtIndex:([PHQ9QuizInfo sharedInstance].lastClickedRow) withObject:@"3"];
    NSLog(@"Row %li Score: %@", [PHQ9QuizInfo sharedInstance].lastClickedRow, [PHQ9QuizInfo sharedInstance].scoreArray[[PHQ9QuizInfo sharedInstance].lastClickedRow]);
}
// Sums up the values of scoreArray upon press
- (IBAction)submitButtonPressed:(UIButton *)sender {
    // Sum scoreArray to get final score result
    [PHQ9QuizInfo sharedInstance].quizScore = [[PHQ9QuizInfo sharedInstance].scoreArray valueForKeyPath:@"@sum.self"];
    NSLog(@"Score: %@", [PHQ9QuizInfo sharedInstance].quizScore);
}

//// Get row of button pressed function
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [PHQ9QuizInfo sharedInstance].lastClickedRow = indexPath.row;
//    NSLog(@"This is row %ld", [PHQ9QuizInfo sharedInstance].lastClickedRow);
////    return self.lastClickedRow;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // Initialize scoreArray with 0's to be replaced later with actual quiz score
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
