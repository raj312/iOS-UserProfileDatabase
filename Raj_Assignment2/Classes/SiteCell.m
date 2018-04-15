//
//  SiteCell.m
//  w9ObjectiveCTables2
//
//  Created by Raj on 2018-03-29.
//  Copyright © 2018 Raj. All rights reserved.
//

#import "SiteCell.h"

@implementation SiteCell

@synthesize primaryLabel, secondaryLabel, thirdLabel, myImageView;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        primaryLabel = [[UILabel alloc] init];
        primaryLabel.textAlignment = NSTextAlignmentLeft;
        primaryLabel.font = [UIFont systemFontOfSize:18];
        primaryLabel.textColor = [UIColor blackColor];
        primaryLabel.backgroundColor = [UIColor clearColor];
        
        secondaryLabel = [[UILabel alloc] init];
        secondaryLabel.textAlignment = NSTextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:14];
        secondaryLabel.textColor = [UIColor blueColor];
        secondaryLabel.backgroundColor = [UIColor clearColor];
        
        thirdLabel = [[UILabel alloc] init];
        thirdLabel.textAlignment = NSTextAlignmentLeft;
        thirdLabel.font = [UIFont systemFontOfSize:12];
        thirdLabel.textColor = [UIColor blackColor];
        thirdLabel.backgroundColor = [UIColor clearColor];
        thirdLabel.lineBreakMode = NSLineBreakByWordWrapping;
        thirdLabel.numberOfLines = 6;
        [thirdLabel sizeToFit];
        
        myImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        [self.contentView addSubview:thirdLabel];
        [self.contentView addSubview:myImageView];
    }
    return self;
}

-(void)layoutSubviews {
    myImageView.frame = CGRectMake(5, 5, 100, 110);
    primaryLabel.frame = CGRectMake(110, 5, 460, 20);
    secondaryLabel.frame = CGRectMake(110, 30, 460, 15);
    thirdLabel.frame = CGRectMake(110, 45, 460, 80);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
