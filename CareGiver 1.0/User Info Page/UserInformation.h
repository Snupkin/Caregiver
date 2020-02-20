//
//  UserInformation.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-01-13.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInformation : NSObject

#pragma mark - User Information Variables
@property (nonatomic) NSInteger userID;
@property (strong, nonatomic) NSString *userFullName;
@property (strong, nonatomic) NSString *userFirstName;
@property (strong, nonatomic) NSString *userLastName;
@property (strong, nonatomic) NSNumber *userAge;
@property (strong, nonatomic) NSString *userDateOfBirth;
@property (strong, nonatomic) NSNumber *userHeight;
@property (strong, nonatomic) NSNumber *userWeight;
@property (strong, nonatomic) NSString *userSex;
@property (strong, nonatomic) NSString *userGender;

#pragma mark - Quiz Information Variables
@property (strong, nonatomic) NSMutableArray *aggregateScore;
@property (strong, nonatomic) NSMutableArray *aggregateScoreArray;
@property (strong, nonatomic) NSMutableArray *scoreArrayArray; // Array of previous scoreArrays
@property (strong, nonatomic) NSMutableArray *quizDateTime; // Date quiz was submitted
@property (nonatomic) BOOL riskAlert;
@property (nonatomic) BOOL quizTaken;

@property (strong, nonatomic) NSMutableDictionary *labData;
@property (strong, nonatomic) NSMutableDictionary *favouriteLabs;

+ (UserInformation *) sharedInstance;
@end

NS_ASSUME_NONNULL_END
