//
//  QuizTableViewCell.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2019-12-03.
//  Copyright © 2019 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuizTableViewCell : UITableViewCell

//#pragma mark - Quiz Properties
//
//@property (strong, nonatomic) NSMutableArray *quizQuestions;
//@property (strong, nonatomic) NSString *quizTitle;
//@property (strong, nonatomic) NSMutableArray *scoreArray;
//@property (strong, nonatomic) NSNumber *quizScore;
//@property (nonatomic) bool riskAlert;
//@property (nonatomic) NSInteger lastClickedRow;

#pragma mark - IB Outlets

@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) IBOutlet UILabel *quizLabel;
@property (strong, nonatomic) IBOutlet UIImageView *buttonDividerImage;

#pragma mark - IB Actions

- (IBAction)button1Pressed:(UIButton *)sender;
- (IBAction)button2Pressed:(UIButton *)sender;
- (IBAction)button3Pressed:(UIButton *)sender;
- (IBAction)button4Pressed:(UIButton *)sender;
- (IBAction)submitButtonPressed:(UIButton *)sender;

#pragma mark - Functions

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
