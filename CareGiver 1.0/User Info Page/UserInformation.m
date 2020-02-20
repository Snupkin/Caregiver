//
//  UserInformation.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-01-13.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation
// Personal Info
@synthesize userID;
@synthesize userFullName;
@synthesize userLastName;
@synthesize userFirstName;
@synthesize userAge;
@synthesize userDateOfBirth;
@synthesize userHeight;
@synthesize userWeight;
@synthesize userSex;
@synthesize userGender;
// Quiz Results
@synthesize scoreArrayArray;
@synthesize quizDateTime;
@synthesize riskAlert;
@synthesize quizTaken;
@synthesize aggregateScore;
@synthesize labData;
@synthesize favouriteLabs;

// Made a singleton to store all of the user's personal data as well as quiz scores
+ (UserInformation *) sharedInstance {
    static UserInformation *myInstance = nil;
    if (myInstance == nil) {
    myInstance = [[[self class] alloc] init];
    // Create global instance
        myInstance.userID = 0;
        
        myInstance.userFullName = @"Unspecified";
        myInstance.userLastName = @"Unspecified";
        myInstance.userFirstName = @"Unspecified";
        myInstance.userAge = [NSNumber numberWithInt:0];
        myInstance.userDateOfBirth = @"Unspecified";
        myInstance.userHeight = [NSNumber numberWithFloat:0.0];
        myInstance.userWeight = [NSNumber numberWithFloat:0.0];
        myInstance.userSex = @"Unspecified";
        myInstance.userGender = @"Unspecified";
        
        myInstance.scoreArrayArray = [[NSMutableArray alloc] init];
        myInstance.aggregateScore = [[NSMutableArray alloc] initWithCapacity:9];
        
        myInstance.aggregateScoreArray = [[NSMutableArray alloc] init];
        myInstance.quizDateTime = [[NSMutableArray alloc] init];
        
        myInstance.riskAlert = NO;
        myInstance.quizTaken = NO;
        
        myInstance.labData = [[NSMutableDictionary alloc] init];
        myInstance.favouriteLabs = [[NSMutableDictionary alloc] init];
        
    }
    return myInstance;
}


@end
