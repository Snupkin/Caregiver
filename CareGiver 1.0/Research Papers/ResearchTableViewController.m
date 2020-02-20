//
//  ResearchTableViewController.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-01-07.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import "ResearchTableViewController.h"
#import "LabSummary.h"
#import "ResearchViewController.h"
#import "UserInformation.h"

@interface ResearchTableViewController ()

@end

@implementation ResearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if (self.labDictionary.count == 0) { // No lab data passed
        self.labDictionary = [[NSMutableDictionary alloc] init];
        self.labArray = [[NSMutableArray alloc] init];
        
        LabSummary *lab1 = [[LabSummary alloc] initWithTitle:@"Sleep loss causes social withdrawal and loneliness" authors:[[NSMutableArray alloc] initWithObjects:@"Eti Ben Simon", @"Matthew P. Walker", nil] symptoms:[[NSMutableArray alloc] initWithObjects:@0, @1, @3, @0, @1, @0, @0, @1, @0, nil] keywords:[[NSMutableArray alloc] initWithObjects:@"Social Separation", @"Loneliness", @"Depressive Mood", nil] wellnessTask:@"Consistently get 7-9 houts of sleep per night and minimize screen time within one hour of sleeping." summary:@"Sleep loss causes subjects to score notably lower on measures of social behaviour and had increased feeling of loneliness." subjectGroup:[[NSMutableArray alloc] initWithObjects:@"18 healthy adult aged 18-24 (abstained from alcohol and caffeine for 72 hours prior to study)(no history of sleep disorders, neurological disorders, closed head injuries, drug abuse and current use of antidepressants or hypnotic therapy", nil] otherFindings:[[NSMutableArray alloc] initWithObjects:@"Sociality is integral to human health and wellbeing", @"Social isolation and loneliness are known risk factors for premature death more so than obesity", @"Individuals who feel socially isolated and alone have higher rates of cardiovascular disease, alcoholism and suicidality", nil] limitations:[[NSMutableArray alloc] init] citations:[[NSMutableArray alloc] initWithObjects:@"(1) Eisenberger NI, Taylor SE, Gable SL, Hilmert CJ, Lieberman MD. Neural pathways link social support to attenuated neuroendocrine stress responses. Neuroimage. 2007;35:1601–1612. doi: 10.1016/j.neuroimage.2007.01.038.", @"(2) Cacioppo JT, et al. Loneliness and health: potential mechanisms. Psychosom. Med. 2002;64:407–417. doi: 10.1097/00006842-200205000-00005", @"(3) House JS, Landis KR, Umberson D. Social relationships and health. Science. 1988;241:540. doi: 10.1126/science.3399889.", @"(4) Berkman LF, Syme SL. Social networks, host resistance, and mortality: a nine-year follow-up study of Alameda County residents. Am. J. Epidemiol. 1979;109:186–204. doi: 10.1093/oxfordjournals.aje.a112674.", @"(5) Holt-Lunstad J, Smith TB, Baker M, Harris T, Stephenson D. Loneliness and social isolation as risk factors for mortality: a meta-analytic review. Perspect. Psychol. Sci. 2015;10:227–237. doi: 10.1177/1745691614568352.", @"(6) Cacioppo S, Capitanio JP, Cacioppo JT. Toward a neurology of loneliness. Psychol. Bull. 2014;140:1464. doi: 10.1037/a0037618.", nil] favourited:NO read:NO];
        
        LabSummary *lab2 = [[LabSummary alloc] initWithTitle:@"No more FOMO: Limiting Social Media Decreases Loneliness and Depression" authors:[[NSMutableArray alloc] initWithObjects:@"Melissa G. Hunt", @"Rachel Marx", @"Courtney Lipson",@"Jordyn Young", nil] symptoms:[[NSMutableArray alloc] initWithObjects:@0, @1, @0, @0, @0, @3, @0, @1, @0, nil] keywords:[[NSMutableArray alloc] initWithObjects:@"Social Media Use", @"Depressive Mood", @"Loneliness", nil] wellnessTask:@"Reduce Social Media use to 10 minutes per day per platform" summary:@"Reduction of social media use on smartphones to 30 minutes per day reduced depression symptoms, anxiety, fear of missing out and general feelings of loneliness and increase feelings of perceived social support, self esteem and general well being amongst university students" subjectGroup:[[NSMutableArray alloc] initWithObjects:@"143 undergraduate students at the University of Pennsylvania", @"103 Women and 35 Men", @"Students selected via psychology courses requiring lab participation", @"Required to already use Snapchat, Instagram and Facebook", nil] otherFindings:[[NSMutableArray alloc] initWithObjects:@"Self-reported Facebook and Instagram usage have been found to correlate positively with symptoms of depression both directly and indirectly", @"Higher usage of Facebook has been found to be associated with lower self-esteem cross sectionally as well as greater loneliness", nil] limitations:[[NSMutableArray alloc] initWithObjects:@"Self reporting data and scope limited to 3 major platforms", @"Effects are disproportionately experienced by subjects with higher levels of loneliness and/or depressive symptoms", @"Beck Depression Inventory mean reductions of 1 point aren’t clinically significant", nil] citations:[[NSMutableArray alloc] initWithObjects:@"(1) Donnelly, E., & Kuss, D. J. (2016). Depression among users of Social Networking Sites (SNSs): The role of SNS addiction and increased usage. Journal of Addiction and Preventative Medicine, 1, 1–6. http://doi.org/10.19104/japm.2016.107", @"(2) Lup, K., Trub, L., & Rosenthal, L. (2015). Instagram #Instasad?: Exploring associations among Instagram use, depressive symptoms, negative social comparison, and strangers followed. Cyberpsychology, Behavior, and Social Networking, 18, 247–252. https://doi.org/10.1089/cyber.2014.0560", @"(3) Rosen, L. D., Whaling, K., Rab, S., Carrier, L. M., & Cheever, N. A. (2013). Is Facebook creating ‘‘iDisorders’’? The link between clinical symptoms of psychiatric disorders and technology use, attitudes and anxiety. Computers in Human Behavior, 29, 1243–1254. https://doi.org/10.1016/j.chb.2012.11.012", @"(4) Tandoc, E. C., Jr., Ferrucci, P., & Duffy, M. (2015). Facebook use, envy, and depression among college students: Is Facebooking depressing? Computers in Human Behavior, 43, 139–146. https://doi.org/10.1016/j.chb.2014.10.053", @"(5) Kalpidou, M., Costin, D., & Morris, J. (2011). The relationship between Facebook and the well-being of undergraduate college students. Cyberpsychology, Behavior, and Social Networking, 14, 183–189. https://doi.org/10.1089/cyber.2010.0061", @"(6) Song, H., Zmyslinski-Seelig, A., Kim, J., Drent, A., Victor, A., Omori, K., & Allen, M. (2014). Does Facebook make you lonely?: A meta-analysis. Computers in Human Behavior, 36, 446–452", nil] favourited:NO read:NO];
        
        LabSummary *lab3 = [[LabSummary alloc] initWithTitle:@"Lab 3 Title" authors:[[NSMutableArray alloc] initWithObjects:@"Some Author", @"Some Other Author", @"Yet Another Author",@"Another Other Author", nil] symptoms:[[NSMutableArray alloc] initWithObjects:@1, @3, @0, @2, @0, @0, @0, @1, @0, nil] keywords:[[NSMutableArray alloc] initWithObjects:@"A Symptom", @"Another Symptom", @"And Another One", nil] wellnessTask:@" Drink your milk, stay in school, don't do drugs and get eight hours of sleep." summary:@"Oh yes definitely we need one of these bad boys. Something generic but specific, not too long not too short. It should capture the essence of the article without being superfluous." subjectGroup:[[NSMutableArray alloc] initWithObjects:@"You", @"Your ancestors", @"Your cow", nil] otherFindings:[[NSMutableArray alloc] initWithObjects:@"7 quarters", @"A piece of yarn", @"My child-like sense of wonder", @"The lost city of atlantis", @"My glasses", @"My car keys", nil] limitations:[[NSMutableArray alloc] initWithObjects:@"Below average", @"Addictions", @"Short-sightedness", nil] citations:[[NSMutableArray alloc] initWithObjects:@"The father", @"The son", @"The holy ghost", nil] favourited:NO read:NO];
        
        LabSummary *lab4 = [[LabSummary alloc] initWithTitle:@"Lab 4 Title" authors:[[NSMutableArray alloc] initWithObjects:@"Some Author", @"Some Other Author", @"Yet Another Author",@"Another Other Author", nil] symptoms:[[NSMutableArray alloc] initWithObjects:@1, @0, @0, @2, @0, @0, @0, @1, @3, nil] keywords:[[NSMutableArray alloc] initWithObjects:@"A Symptom", @"Another Symptom", @"And Another One", nil] wellnessTask:@" Drink your milk, stay in school, don't do drugs and get eight hours of sleep." summary:@"Oh yes definitely we need one of these bad boys. Something generic but specific, not too long not too short. It should capture the essence of the article without being superfluous." subjectGroup:[[NSMutableArray alloc] initWithObjects:@"You", @"Your ancestors", @"Your cow", nil] otherFindings:[[NSMutableArray alloc] initWithObjects:@"7 quarters", @"A piece of yarn", @"My child-like sense of wonder", @"The lost city of atlantis", @"My glasses", @"My car keys", nil] limitations:[[NSMutableArray alloc] initWithObjects:@"Below average", @"Addictions", @"Short-sightedness", nil] citations:[[NSMutableArray alloc] initWithObjects:@"The father", @"The son", @"The holy ghost", nil] favourited:NO read:NO];
        
        LabSummary *lab5 = [[LabSummary alloc] initWithTitle:@"Lab 5 Title" authors:[[NSMutableArray alloc] initWithObjects:@"Some Author", @"Some Other Author", @"Yet Another Author",@"Another Other Author", nil] symptoms:[[NSMutableArray alloc] initWithObjects:@1, @0, @0, @1, @0, @0, @0, @3, @0, nil] keywords:[[NSMutableArray alloc] initWithObjects:@"A Symptom", @"Another Symptom", @"And Another One", nil] wellnessTask:@" Drink your milk, stay in school, don't do drugs and get eight hours of sleep." summary:@"Oh yes definitely we need one of these bad boys. Something generic but specific, not too long not too short. It should capture the essence of the article without being superfluous." subjectGroup:[[NSMutableArray alloc] initWithObjects:@"You", @"Your ancestors", @"Your cow", nil] otherFindings:[[NSMutableArray alloc] initWithObjects:@"7 quarters", @"A piece of yarn", @"My child-like sense of wonder", @"The lost city of atlantis", @"My glasses", @"My car keys", nil] limitations:[[NSMutableArray alloc] initWithObjects:@"Below average", @"Addictions", @"Short-sightedness", nil] citations:[[NSMutableArray alloc] initWithObjects:@"The father", @"The son", @"The holy ghost", nil] favourited:NO read:NO];
        
        LabSummary *lab6 = [[LabSummary alloc] initWithTitle:@"Lab 6 Title" authors:[[NSMutableArray alloc] initWithObjects:@"Some Author", @"Some Other Author", @"Yet Another Author",@"Another Other Author", nil] symptoms:[[NSMutableArray alloc] initWithObjects:@1, @0, @0, @2, @0, @3, @0, @1, @0, nil] keywords:[[NSMutableArray alloc] initWithObjects:@"A Symptom", @"Another Symptom", @"And Another One", nil] wellnessTask:@" Drink your milk, stay in school, don't do drugs and get eight hours of sleep." summary:@"Oh yes definitely we need one of these bad boys. Something generic but specific, not too long not too short. It should capture the essence of the article without being superfluous." subjectGroup:[[NSMutableArray alloc] initWithObjects:@"You", @"Your ancestors", @"Your cow", nil] otherFindings:[[NSMutableArray alloc] initWithObjects:@"7 quarters", @"A piece of yarn", @"My child-like sense of wonder", @"The lost city of atlantis", @"My glasses", @"My car keys", nil] limitations:[[NSMutableArray alloc] initWithObjects:@"Below average", @"Addictions", @"Short-sightedness", nil] citations:[[NSMutableArray alloc] initWithObjects:@"The father", @"The son", @"The holy ghost", nil] favourited:NO read:NO];
        
        LabSummary *lab7 = [[LabSummary alloc] initWithTitle:@"Lab 7 Title" authors:[[NSMutableArray alloc] initWithObjects:@"Some Author", @"Some Other Author", @"Yet Another Author",@"Another Other Author", nil] symptoms:[[NSMutableArray alloc] initWithObjects:@1, @3, @0, @2, @0, @0, @0, @1, @0, nil] keywords:[[NSMutableArray alloc] initWithObjects:@"A Symptom", @"Another Symptom", @"And Another One", nil] wellnessTask:@" Drink your milk, stay in school, don't do drugs and get eight hours of sleep." summary:@"Oh yes definitely we need one of these bad boys. Something generic but specific, not too long not too short. It should capture the essence of the article without being superfluous." subjectGroup:[[NSMutableArray alloc] initWithObjects:@"You", @"Your ancestors", @"Your cow", nil] otherFindings:[[NSMutableArray alloc] initWithObjects:@"7 quarters", @"A piece of yarn", @"My child-like sense of wonder", @"The lost city of atlantis", @"My glasses", @"My car keys", nil] limitations:[[NSMutableArray alloc] initWithObjects:@"Below average", @"Addictions", @"Short-sightedness", nil] citations:[[NSMutableArray alloc] initWithObjects:@"The father", @"The son", @"The holy ghost", nil] favourited:NO read:NO];
        
        LabSummary *lab8 = [[LabSummary alloc] initWithTitle:@"Lab 8 Title" authors:[[NSMutableArray alloc] initWithObjects:@"Some Author", @"Some Other Author", @"Yet Another Author",@"Another Other Author", nil] symptoms:[[NSMutableArray alloc] initWithObjects:@1, @1, @1, @2, @0, @3, @0, @1, @0, nil] keywords:[[NSMutableArray alloc] initWithObjects:@"A Symptom", @"Another Symptom", @"And Another One", nil] wellnessTask:@" Drink your milk, stay in school, don't do drugs and get eight hours of sleep." summary:@"Oh yes definitely we need one of these bad boys. Something generic but specific, not too long not too short. It should capture the essence of the article without being superfluous." subjectGroup:[[NSMutableArray alloc] initWithObjects:@"You", @"Your ancestors", @"Your cow", nil] otherFindings:[[NSMutableArray alloc] initWithObjects:@"7 quarters", @"A piece of yarn", @"My child-like sense of wonder", @"The lost city of atlantis", @"My glasses", @"My car keys", nil] limitations:[[NSMutableArray alloc] initWithObjects:@"Below average", @"Addictions", @"Short-sightedness", nil] citations:[[NSMutableArray alloc] initWithObjects:@"The father", @"The son", @"The holy ghost", nil] favourited:NO read:NO];
        
        LabSummary *lab9 = [[LabSummary alloc] initWithTitle:@"Lab 9 Title" authors:[[NSMutableArray alloc] initWithObjects:@"Some Author", @"Some Other Author", @"Yet Another Author",@"Another Other Author", nil] symptoms:[[NSMutableArray alloc] initWithObjects:@1, @0, @0, @0, @1, @0, @2, @2, @3, nil] keywords:[[NSMutableArray alloc] initWithObjects:@"A Symptom", @"Another Symptom", @"And Another One", nil] wellnessTask:@" Drink your milk, stay in school, don't do drugs and get eight hours of sleep." summary:@"Oh yes definitely we need one of these bad boys. Something generic but specific, not too long not too short. It should capture the essence of the article without being superfluous." subjectGroup:[[NSMutableArray alloc] initWithObjects:@"You", @"Your ancestors", @"Your cow", nil] otherFindings:[[NSMutableArray alloc] initWithObjects:@"7 quarters", @"A piece of yarn", @"My child-like sense of wonder", @"The lost city of atlantis", @"My glasses", @"My car keys", nil] limitations:[[NSMutableArray alloc] initWithObjects:@"Below average", @"Addictions", @"Short-sightedness", nil] citations:[[NSMutableArray alloc] initWithObjects:@"The father", @"The son", @"The holy ghost", nil] favourited:NO read:NO];
        
        LabSummary *lab0 = [[LabSummary alloc] initWithTitle:@"Lab 0 Title" authors:[[NSMutableArray alloc] initWithObjects:@"Some Author", @"Some Other Author", @"Yet Another Author",@"Another Other Author", nil] symptoms:[[NSMutableArray alloc] initWithObjects:@1, @3, @0, @2, @0, @0, @0, @1, @0, nil] keywords:[[NSMutableArray alloc] initWithObjects:@"A Symptom", @"Another Symptom", @"And Another One", nil] wellnessTask:@" Drink your milk, stay in school, don't do drugs and get eight hours of sleep." summary:@"Oh yes definitely we need one of these bad boys. Something generic but specific, not too long not too short. It should capture the essence of the article without being superfluous." subjectGroup:[[NSMutableArray alloc] initWithObjects:@"You", @"Your ancestors", @"Your cow", nil] otherFindings:[[NSMutableArray alloc] initWithObjects:@"7 quarters", @"A piece of yarn", @"My child-like sense of wonder", @"The lost city of atlantis", @"My glasses", @"My car keys", nil] limitations:[[NSMutableArray alloc] initWithObjects:@"Below average", @"Addictions", @"Short-sightedness", nil] citations:[[NSMutableArray alloc] initWithObjects:@"The father", @"The son", @"The holy ghost", nil] favourited:NO read:NO];
        
        // Add labs to dictionary
        [self.labDictionary setObject:lab1 forKey:lab1.title];
        [self.labDictionary setObject:lab2 forKey:lab2.title];
        [self.labDictionary setObject:lab3 forKey:lab3.title];
        [self.labDictionary setObject:lab4 forKey:lab4.title];
        [self.labDictionary setObject:lab5 forKey:lab5.title];
        [self.labDictionary setObject:lab6 forKey:lab6.title];
        [self.labDictionary setObject:lab7 forKey:lab7.title];
        [self.labDictionary setObject:lab8 forKey:lab8.title];
        [self.labDictionary setObject:lab9 forKey:lab9.title];
        [self.labDictionary setObject:lab0 forKey:lab0.title];

        // Add labs to array
        for (id labKey in self.labDictionary) {
            [self.labArray addObject:[self.labDictionary objectForKey:labKey]];
        }
        
    }
    // Calculate lab compatibility
    int i,j;
    NSMutableArray *compatibilityArray = [[NSMutableArray alloc] init];
    for (i = 0; i < self.labArray.count; i++) {
        LabSummary *currentLab = [self.labArray objectAtIndex:i];
        NSMutableArray *scoreArray = [[UserInformation sharedInstance].scoreArrayArray lastObject];
        NSInteger compatibility = 0;
        for (j = 0; j < currentLab.symptoms.count; j++) {
            compatibility = compatibility + [[currentLab.symptoms objectAtIndex:j] integerValue] * [[scoreArray objectAtIndex:j] integerValue];
        }
        [compatibilityArray addObject:[NSNumber numberWithInteger:compatibility]];
    }
    //    self.labArray = [self doubleBubbleSort:compatibilityArray];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; // Maybe add a section for importance of papers
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.labDictionary.count; // Set number of rows equal to number of papers
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ResearchTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
//    // Set background color of cells
//    int i; // for loop counter
//    for (i = 0; i < 6; i++) {
//        if (indexPath.row == i && i < 3) {
//            cell.backgroundColor = [UIColor colorWithRed:5.0/255.0f green:255.0/255.0f blue:5.0/255.0f alpha:0.1f]; // Some green color
//        }
//        else if (indexPath.row == i && i >= 3 && i < 6){
//            cell.backgroundColor = [UIColor colorWithRed:45.0/255.0f green:100.0/255.0f blue:245.0/255.0f alpha:0.1f];
//        }
//    }
    
#pragma mark - Labs
    LabSummary *rowLab = [self.labArray objectAtIndex:indexPath.row];
    cell.textLabel.text = rowLab.title;
    cell.textLabel.numberOfLines = 2;
    cell.detailTextLabel.numberOfLines = 2;
    cell.detailTextLabel.text = rowLab.summary;
    // Configure image color
    cell.imageView.image = [cell.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [cell.imageView setTintColor:[UIColor redColor]];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass:[ResearchViewController class]]) {
            ResearchViewController *researchVC = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell:sender]; // Get path for cell
            researchVC.labData = [self.labArray objectAtIndex:path.row]; // path.row is row for cell
            researchVC.labDictionary = self.labDictionary;
        }
    }
}


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
#pragma mark - Functions

// Bubble sort
- (NSMutableArray *)doubleBubbleSort:(NSMutableArray *)unsortedDataArray arrayToSort:(NSMutableArray *)arrayToSort
{
    long count = unsortedDataArray.count;
    int i;
    bool swapped = TRUE;
    while (swapped){
        swapped = FALSE;
        for (i = 1; i < count; i++)
        {
            if ([unsortedDataArray objectAtIndex:(i - 1)] > [unsortedDataArray objectAtIndex:i])
            {
                [unsortedDataArray exchangeObjectAtIndex:(i - 1) withObjectAtIndex:i];
                [arrayToSort exchangeObjectAtIndex:(i - 1) withObjectAtIndex:i];
                swapped = TRUE;
            }
            //bubbleSortCount ++; //Increment the count everytime a switch is done, this line is not required in the production implementation.
        }
    }
    return arrayToSort;
}

@end
