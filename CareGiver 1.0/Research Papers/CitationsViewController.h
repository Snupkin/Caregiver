//
//  CitationsViewController.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2020-02-11.
//  Copyright © 2020 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CitationsViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *citations;

// IBOutlets
@property (strong, nonatomic) IBOutlet UITextView *citationsTextView;

@end

NS_ASSUME_NONNULL_END
