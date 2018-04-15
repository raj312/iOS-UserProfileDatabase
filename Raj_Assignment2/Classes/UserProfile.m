//
//  UserProfile.m
//  RajPatel_Assignment2
//
//  Created by Raj on 2018-04-13.
//  Copyright © 2018 Raj. All rights reserved.
//

#import "UserProfile.h"

@implementation UserProfile
@synthesize name, address, phone, email, age, gender, dateOfBirth, avatar;

-(id)initWithData:(NSString *)name theAddress:(NSString *)address thePhone:(NSString *)phone theEmail:(NSString *)email theAge:(NSString *)age theGender:(NSString *)gender theDateOfBirth:(NSString *)dateOfBirth theAvatar:(NSString *)avatar {
    if(self = [super init]){
        self.name = name;
        self.address = address;
        self.phone = phone;
        self.email = email;
        self.age = age;
        self.gender = gender;
        self.dateOfBirth = dateOfBirth;
        self.avatar = avatar;
    }
    return self;
}

@end
