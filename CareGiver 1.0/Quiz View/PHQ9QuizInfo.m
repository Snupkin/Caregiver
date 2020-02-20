//
//  PHQ9QuizInfo.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-01-13.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import "PHQ9QuizInfo.h"

@implementation PHQ9QuizInfo

// Quiz Properties
@synthesize quizQuestions;
//@synthesize quizTitle;
//@synthesize scoreArray;
//@synthesize quizScore;
//@synthesize riskAlert;
//@synthesize lastClickedRow;

// Define the quiz questions
NSString *question1 = @"Little interest or pleasure in doing things?";
NSString *question2 = @"Feeling down, depressed, or hopeless?";
NSString *question3 = @"Trouble falling or staying asleep or sleeping too much?";
NSString *question4 = @"Feeling tired or having little energy?";
NSString *question5 = @"Poor appetite or overeating?";
NSString *question6 = @"Feeling bad about yourself - or that you are a failure or have let yourself or your family down?";
NSString *question7 = @"Trouble concentrating on things such as reading the newspaper or watching television?";
NSString *question8 = @"Moving or speaking so slowly that other people could have noticed? Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual?";
NSString *question9 = @"Thoughts that you would be better off dead or of hurting yourself in some way?";


+ (PHQ9QuizInfo *) sharedInstance {
    static PHQ9QuizInfo *myInstance = nil;
    if (myInstance == nil) {
        myInstance = [[[self class] alloc] init];
        // Create global instance
        myInstance.quizQuestions = [[NSMutableArray alloc] initWithObjects:question1, question2, question3, question4, question5, question6, question7,  question8, question9, nil];
        myInstance.aggregateWeights = [[NSArray alloc] initWithObjects:@1, @2, @4, @8, @16, nil];
//        myInstance.quizTitle = @"How often have you been bothered by the following over the past 2 weeks?";
//        myInstance.scoreArray =[[NSMutableArray alloc] initWithObjects: @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", nil];
//        myInstance.quizScore = [NSNumber numberWithInt:0];
//        myInstance.riskAlert = false;
    }
    return myInstance;
}

@end
