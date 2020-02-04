 //
//  TableViewController.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2019-11-27.
//  Copyright © 2019 Atlas Life Systems. All rights reserved.
//

/*
 This class is meant to be a quiz implementation of PHQ-9 using a tableview
*/

#import "TableViewController.h"
#import "QuizTableViewCell.h"
#import "PHQ9QuizInfo.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // [self.tableView registerNib:[UINib nibWithNibName:@"QuizTableCell" bundle:nil] forCellReuseIdentifier:@"QuizTableCell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
#pragma mark - TableView Footer Section
    /*
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 500)];
    [footerView setBackgroundColor:[UIColor lightGrayColor]];
    self.tableView.tableFooterView = footerView;
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setContentInset:(UIEdgeInsetsMake(0, 0, -500, 0))];
    */
    
#pragma mark - Quiz Property Initialization
    
    self.myCell = [[QuizTableViewCell alloc] init];
}

#pragma mark - Cell Properties

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    // Return the number of rows in each section.
    // First Row: Title Section
    if (section == 0) {
        return 1; // Needs one row for the title
    }
    // Main Body: Quiz Question Section
    else if (section == 1) {
        return [[PHQ9QuizInfo sharedInstance].quizQuestions count]; // Needs rows equal to number of questions (minus the nil placeholder)
    }
    // Final Row: Submit button section
    else {
        return 1; // Needs one row for the submit quiz prompt
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"QuizTableCell";
    QuizTableViewCell *cell = (QuizTableViewCell *)[tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    // Register nib
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QuizTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // Configure the cell...
    // For the first cell display the quiz title
    if (indexPath.section == 0){
cell.backgroundColor = [UIColor colorWithRed:81.0f/255.0f green:160.0f/255.0f blue:213.0f/255.0f alpha:0.8f];
        // Text modifications
        //cell.quizLabel.font = [self findAdaptiveFontWithName:@"System" forUILabelSize:cell.quizLabel.frame.size withMinimumSize:54];
//        cell.quizLabel.text = [PHQ9QuizInfo sharedInstance].quizTitle;
        
        // Set the cell button states
        cell.button1.hidden = true;
        cell.button2.hidden = true;
        cell.button3.hidden = true;
        cell.button4.hidden = true;
        cell.submitButton.hidden = true;
        
        // Button Divider Image
        cell.buttonDividerImage.image = nil;
    }
    else if (indexPath.section == 1){
        cell.backgroundColor = [UIColor colorWithRed:50.0f/255.0f green:100.0f/255.0f blue:200.0f/255.0f alpha:0.25f];
        
        cell.quizLabel.text = [[PHQ9QuizInfo sharedInstance].quizQuestions objectAtIndex:(indexPath.row)];
        
        // Set the cell button states
        cell.button1.hidden = false;
        cell.button2.hidden = false;
        cell.button3.hidden = false;
        cell.button4.hidden = false;
        cell.submitButton.hidden = true;
        
        // Button Divider Image - Done in front end
         cell.buttonDividerImage.image = [UIImage imageNamed:@"buttonDivider.png"];
    }
    else {
        cell.backgroundColor = [UIColor lightGrayColor];
        
        cell.quizLabel.text = @"Thank you for completing the quiz. Please press submit when you are finished.";
        
        // Set the cell button states
        cell.button1.hidden = true;
        cell.button2.hidden = true;
        cell.button3.hidden = true;
        cell.button4.hidden = true;
        cell.submitButton.hidden = false;
        
        // Button Divider Image
        cell.buttonDividerImage.image = nil;

    }
    
    return cell;
}

#pragma mark - Get selected cell row
// Get row of button pressed function
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [PHQ9QuizInfo sharedInstance].lastClickedRow = indexPath.row;
//    NSLog(@"This is row %ld", [PHQ9QuizInfo sharedInstance].lastClickedRow);
    //    return self.lastClickedRow;
}

#pragma mark - Table view data source

// Function determines number of sections in cell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    // Return the number of sections.
    return 3;
}

#pragma mark - Font Adjustments
/*
// Function auto adjusts text font to fit label container
+ (UIFont *)findAdaptiveFontWithName:(NSString *)fontName forUILabelSize:(CGSize)labelSize withMinimumSize:(NSInteger)minSize
{
    UIFont *tempFont = nil;
    NSString *testString = @"Test String";
    CGSize size = [testString sizeWithAttributes: @{NSFontAttributeName: tempFont}];
    
    NSInteger tempMin = minSize;
    NSInteger tempMax = 256;
    NSInteger mid = 0;
    NSInteger difference = 0;
    
    while (tempMin <= tempMax) {
        mid = tempMin + (tempMax - tempMin) / 2;
        tempFont = [UIFont fontWithName:fontName size:mid];
        difference = labelSize.height - size.height;
        
        if (mid == tempMin || mid == tempMax) {
            if (difference < 0) {
                return [UIFont fontWithName:fontName size:(mid - 1)];
            }
            
            return [UIFont fontWithName:fontName size:mid];
        }
        
        if (difference < 0) {
            tempMax = mid - 1;
        } else if (difference > 0) {
            tempMin = mid + 1;
        } else {
            return [UIFont fontWithName:fontName size:mid];
        }
    }
    
    return [UIFont fontWithName:fontName size:mid];
}
 */

 // Function readjusts cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 72;
    }
    return 156.5;
}

#pragma mark - Extra Unused Code

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
