//
//  QuizTableViewCell.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2019-12-03.
//  Copyright © 2019 Atlas Life Systems. All rights reserved.
//

#import "QuizTableViewCell.h"
#import "TableViewController.h"

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
    [self.scoreArray replaceObjectAtIndex:(self.lastClickedRow) withObject:@"0"];
    NSLog(@"Row %li Score: %@", self.lastClickedRow, self.scoreArray[self.lastClickedRow]);
}

- (IBAction)button2Pressed:(UIButton *)sender {
    [self.scoreArray replaceObjectAtIndex:(self.lastClickedRow) withObject:@"1"];
    NSLog(@"Row %li Score: %@", self.lastClickedRow, self.scoreArray[self.lastClickedRow]);
}

- (IBAction)button3Pressed:(UIButton *)sender {
    [self.scoreArray replaceObjectAtIndex:(self.lastClickedRow) withObject:@"2"];
    NSLog(@"Row %li Score: %@", self.lastClickedRow, self.scoreArray[self.lastClickedRow]);
}

- (IBAction)button4Pressed:(UIButton *)sender {
    [self.scoreArray replaceObjectAtIndex:(self.lastClickedRow) withObject:@"3"];
    NSLog(@"Row %li Score: %@", self.lastClickedRow, self.scoreArray[self.lastClickedRow]);
}
// Sums up the values of scoreArray upon press
- (IBAction)submitButtonPressed:(UIButton *)sender {
    // Sum scoreArray to get final score result
    self.quizScore = [self.scoreArray valueForKeyPath:@"@sum.self"];
    NSLog(@"Score: %@", self.quizScore);
}

// Get row of button pressed function
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.lastClickedRow = indexPath.row;
    // return self.lastClickedRow;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // Initialize scorArray with 0's to be replaced later with actual quiz score
    self.scoreArray = [[NSMutableArray alloc] initWithObjects: @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
