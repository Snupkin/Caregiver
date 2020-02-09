//
//  LabSummary.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-04.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LabSummary : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSMutableArray *authors;
@property (strong, nonatomic) NSMutableArray *symptoms; // Bitmap
@property (strong, nonatomic) NSMutableArray *keywords;
@property (strong, nonatomic) NSString *wellnessTask;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSMutableArray *subjectGroup;
@property (strong, nonatomic) NSMutableArray *otherFindings;
@property (strong, nonatomic) NSMutableArray *limitations;
@property (strong, nonatomic) NSMutableArray *citations;


- (instancetype)initWithTitle:(NSString *)title authors:(NSMutableArray *)authors symptoms:(NSMutableArray *)symptoms keywords:(NSMutableArray *)keywords wellnessTask:(NSString *)wellnessTask summary:(NSString *)summary subjectGroup:(NSMutableArray *)subjectGroup otherFindings:(NSMutableArray *)otherFindings limitations:(NSMutableArray *)limitations citations:(NSMutableArray *)citations;

@end

NS_ASSUME_NONNULL_END
