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
NSString *question3 = @"Trouble falling asleep or staying asleep (insomnia)?";
NSString *question4 = @"Sleeping too much (hypersomnia)?";
NSString *question5 = @"Feeling tired or having little energy?";
NSString *question6 = @"Poor appetite (excluding dieting)?";
NSString *question7 = @"Overeating (excluding dieting)?";
NSString *question8 = @"Feeling bad about yourself - or that you are a failure or have let yourself or your family down?";
NSString *question9 = @"Trouble concentrating on things, such as reading the newspaper or watchin television?";
NSString *question10 = @"Moving or speaking so slowly that other people could have noticed (psychomotor retardation)?";
NSString *question11 = @"Pacing, restlessness or an inability to sit still (psychomotor agitation)?";
NSString *question12 = @"Thoughts that you would be better off dead (suicide), or thoughts of hurting yourself in some way?";

+ (PHQ9QuizInfo *) sharedInstance {
    static PHQ9QuizInfo *myInstance = nil;
    if (myInstance == nil) {
        myInstance = [[[self class] alloc] init];
        // Create global instance
        myInstance.quizQuestions = [[NSMutableArray alloc] initWithObjects:question1, question2, question3, question4, question5, question6, question7,  question8, question9, question10, question11, question12, nil];
//        myInstance.quizTitle = @"How often have you been bothered by the following over the past 2 weeks?";
//        myInstance.scoreArray =[[NSMutableArray alloc] initWithObjects: @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", nil];
//        myInstance.quizScore = [NSNumber numberWithInt:0];
//        myInstance.riskAlert = false;
    }
    return myInstance;
}

@end
