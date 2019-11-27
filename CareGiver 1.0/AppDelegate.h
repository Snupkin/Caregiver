//
//  AppDelegate.h
//  CareGiver 1.0
//
//  Created by Dj Avivi on 2019-11-27.
//  Copyright © 2019 Atlas Life Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

