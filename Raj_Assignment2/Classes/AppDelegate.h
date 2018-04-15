//
//  AppDelegate.h
//  Raj_Assignment2
//
//  Created by Raj on 2018-04-13.
//  Copyright © 2018 Raj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"
#import <sqlite3.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *databaseName;
    NSString *databasePath;
    NSMutableArray *users;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableArray *users;
-(void)readDataFromDatabase; //so that it can be used by other classes
-(BOOL)insertIntoDatabase:(UserProfile *)user;
@end

