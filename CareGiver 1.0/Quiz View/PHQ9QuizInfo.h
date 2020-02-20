//
//  PHQ9QuizInfo.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-01-13.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PHQ9QuizInfo : NSObject

@property (strong, nonatomic) NSMutableArray *quizQuestions;
@property (strong, nonatomic) NSArray *aggregateWeights;


//@property (strong, nonatomic) NSString *quizTitle;
//@property (strong, nonatomic) NSMutableArray *scoreArray;
//@property (strong, nonatomic) NSNumber *quizScore;
//@property (nonatomic) bool riskAlert;
//@property (nonatomic) NSInteger lastClickedRow;

+ (PHQ9QuizInfo *) sharedInstance;

@end

NS_ASSUME_NONNULL_END
