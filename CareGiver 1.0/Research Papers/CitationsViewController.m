//
//  CitationsViewController.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-11.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import "CitationsViewController.h"

@interface CitationsViewController ()

@end

@implementation CitationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *citations = [self.citations componentsJoinedByString:@"\n\n"];
    
    self.citationsTextView.editable = false;
    self.citationsTextView.text = citations;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
