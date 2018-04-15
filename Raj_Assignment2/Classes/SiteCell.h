//
//  SiteCell.h
//  w9ObjectiveCTables2
//
//  Created by Raj on 2018-03-29.
//  Copyright © 2018 Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SiteCell : UITableViewCell
{
    UILabel *primaryLabel;
    UILabel *secondaryLabel;
    UILabel *thirdLabel;
    UIImageView *myImageView;
}

@property(nonatomic, strong) UILabel *primaryLabel;
@property(nonatomic, strong) UILabel *secondaryLabel;
@property(nonatomic, strong) UILabel *thirdLabel;
@property(nonatomic, strong) UIImageView *myImageView;


@end
