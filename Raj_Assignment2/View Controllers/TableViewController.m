//
//  TableViewController.m
//  Raj_Assignment2
//
//  Created by Raj on 2018-04-14.
//  Copyright © 2018 Raj. All rights reserved.
//

#import "TableViewController.h"
#import "SiteCell.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize mainDelegate;

//number of rows
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return mainDelegate.users.count;
}

//thickness of each cell
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130; //hardcoded value
}

//define what each cell looks like
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SiteCell *cell = (SiteCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[SiteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSInteger row = indexPath.row;
    UserProfile *up = [mainDelegate.users objectAtIndex:row];
    cell.primaryLabel.text = up.name;
    cell.secondaryLabel.text = up.email;
    NSString *allExtraInfo = [[[[[[[[[up.address stringByAppendingString:@" \n"] stringByAppendingString:@"Phone: "] stringByAppendingString:up.phone] stringByAppendingString: @"\nAge: "] stringByAppendingString:up.age] stringByAppendingString:@"\nDate of birth: "] stringByAppendingString:up.dateOfBirth] stringByAppendingString:@"\nGender: "] stringByAppendingString:up.gender];
    
    cell.thirdLabel.text = allExtraInfo;
    cell.myImageView.image = [UIImage imageNamed:up.avatar];
    
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgTable.jpg"]];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //refresh the database
    [mainDelegate readDataFromDatabase];
    printf("In table view did load");
    UITableView *tableView = [[UITableView alloc] init];
    //setting background image
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgTable.jpg"]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
