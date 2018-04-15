//
//  UserProfile.h
//  RajPatel_Assignment2
//
//  Created by Raj on 2018-04-13.
//  Copyright © 2018 Raj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserProfile : NSObject {
    NSString *name;
    NSString *address;
    NSString *phone;
    NSString *email;
    NSString *age;
    NSString *gender;
    NSString *dateOfBirth;
    NSString *avatar;
}

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSString *phone;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *age;
@property(nonatomic, strong) NSString *gender;
@property(nonatomic, strong) NSString *dateOfBirth;
@property(nonatomic, strong) NSString *avatar;

-(id)initWithData:(NSString *)name theAddress:(NSString *)address thePhone:(NSString *)phone theEmail:(NSString *)email theAge:(NSString *)age theGender:(NSString *)gender theDateOfBirth:(NSString *)dateOfBirth theAvatar:(NSString *)avatar;

@end

