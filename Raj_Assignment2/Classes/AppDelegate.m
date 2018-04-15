//
//  AppDelegate.m
//  Raj_Assignment2
//
//  Created by Raj on 2018-04-13.
//  Copyright © 2018 Raj. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize databaseName, databasePath, users;

-(void)checkAndCreateDatabase{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:self.databasePath];
    if (success){
        return;
    }
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databaseName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:self.databasePath error:nil];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.users = [NSMutableArray array];
    self.databaseName = @"userData.db";
    
    //returns an array of documents paths
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    self.databasePath = [documentsDir stringByAppendingPathComponent:self.databaseName];
    
    [self checkAndCreateDatabase];
    return YES;
}

-(void)readDataFromDatabase {
    // clear out array at the start
    [self.users removeAllObjects];
    
    sqlite3 *database;
    //opens connection to database
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK){
        //defining a query
        char *sqlStatement = "SELECT * FROM Users"; //not using @ since its a char
        
        sqlite3_stmt *compileStatement;
        //prepare the object -- -1 all data
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compileStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(compileStatement) == SQLITE_ROW) { //while there is a row returned
                char *n = (char *)sqlite3_column_text(compileStatement, 1); //1 - second column -- name
                NSString *name = [NSString stringWithUTF8String:n];
                
                char *addr = (char *)sqlite3_column_text(compileStatement, 2);
                NSString *address = [NSString stringWithUTF8String:addr];
                
                char *p = (char *)sqlite3_column_text(compileStatement, 3);
                NSString *phone = [NSString stringWithUTF8String:p];
                
                char *e = (char *)sqlite3_column_text(compileStatement, 4);
                NSString *email = [NSString stringWithUTF8String:e];
                
                char *a = (char *)sqlite3_column_text(compileStatement, 5);
                NSString *age = [NSString stringWithUTF8String:a];
                
                char *g = (char *)sqlite3_column_text(compileStatement, 6);
                NSString *gender = [NSString stringWithUTF8String:g];
                
                char *dob = (char *)sqlite3_column_text(compileStatement, 7);
                NSString *dateOfBirth = [NSString stringWithUTF8String:dob];
                
                char *avat = (char *)sqlite3_column_text(compileStatement, 8);
                NSString *avatar = [NSString stringWithUTF8String:avat];
 
                UserProfile *user = [[UserProfile alloc] initWithData:name theAddress:address thePhone:phone theEmail:email theAge:age theGender:gender theDateOfBirth:dateOfBirth theAvatar:avatar];
                [self.users addObject:user];
            }
           
        }
        //cleaning up - free up resources
        sqlite3_finalize(compileStatement);
    }
    sqlite3_close(database);
}

-(BOOL)insertIntoDatabase:(UserProfile *)user {
    sqlite3 *database;
    BOOL returnCode = YES;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
        char *sqlStatement = "Insert INTO Users VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?)";
        //this means there are 8 placeholders and we will replace them with data
        sqlite3_stmt *compiledStatement;
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            //replacing the question marks with proper values
            // 1 - second field in DB
            sqlite3_bind_text(compiledStatement, 1, [user.name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [user.address UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 3, [user.phone UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 4, [user.email UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 5, [user.age UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 6, [user.gender UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 7, [user.dateOfBirth UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 8, [user.avatar UTF8String], -1, SQLITE_TRANSIENT);
            
        }
        if(sqlite3_step(compiledStatement) != SQLITE_DONE) {
            NSLog(@"Error: %s", sqlite3_errmsg(database));
            returnCode = NO;
        }else {
            NSLog(@"Insert into row id = %lld", sqlite3_last_insert_rowid(database));
        }
        //clean up
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
    return returnCode;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
