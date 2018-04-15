//
//  TableViewController.h
//  Raj_Assignment2
//
//  Created by Raj on 2018-04-14.
//  Copyright © 2018 Raj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    AppDelegate *mainDelegate;
}

@property(nonatomic, strong) AppDelegate *mainDelegate;

@end
