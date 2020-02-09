//
//  LabSummary.m
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-04.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import "LabSummary.h"

@implementation LabSummary

- (instancetype)initWithTitle:(NSString *)title authors:(NSMutableArray *)authors symptoms:(NSMutableArray *)symptoms keywords:(NSMutableArray *)keywords wellnessTask:(NSString *)wellnessTask summary:(NSString *)summary subjectGroup:(NSMutableArray *)subjectGroup otherFindings:(NSMutableArray *)otherFindings limitations:(NSMutableArray *)limitations citations:(NSMutableArray *)citations {
    
    self = [super init];
    if (!self) return nil;
    
    self.title = title;
    self.authors = authors;
    self.symptoms = symptoms;
    self.keywords = keywords;
    self.wellnessTask = wellnessTask;
    self.summary = summary;
    self.subjectGroup = subjectGroup;
    self.otherFindings = otherFindings;
    self.limitations = limitations;
    self.citations = citations;
    
    return self;
}


@end
