//
//  AnimationListTableViewController.m
//  LearnPopping
//
//  Created by Asingers on 16/5/13.
//  Copyright © 2016年 Yuanjie Zhang. All rights reserved.
//

#import "AnimationListTableViewController.h"
#import "UIColor+CustomColors.h"
#import "MenuTableViewCell.h"
#import "ButtonViewController.h"
#import "DecayViewController.h"
#import "CircleViewController.h"
#import "ImageViewController.h"
#import "CustomTransitionViewController.h"
#import "PaperButtonViewController.h"
static NSString *const kCellIndentifier = @"cellIdentifier";
@interface AnimationListTableViewController ()

@property(nonatomic,strong) NSArray *items;
-(NSString *)titleForRowAtIndexPath:(NSIndexPath *)indexPath;
-(UIViewController *)viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@implementation AnimationListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Popping";
    [self p_setUpTableView];
    [self p_setUpTitleView];
    
}
-(void)p_setUpTableView{

    self.items = @[@[@"Button Animation",[ButtonViewController class]],
                   @[@"Decay Animation",[DecayViewController class]],
                   @[@"Circle Animation",[CircleViewController class]],
                   @[@"Image Animation",[ImageViewController class]],
                   @[@"Custom Transition",[CustomTransitionViewController class]],
                   @[@"PaperButton Animation",[PaperButtonViewController class]]
                   
                   ];
    [self.tableView registerClass:[MenuTableViewCell class] forCellReuseIdentifier:kCellIndentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 50.f;

}
-(void)p_setUpTitleView{

    UILabel *headLineLabel = [UILabel new];
    headLineLabel.font = [UIFont fontWithName:@"Avenir-Light" size:28];
    headLineLabel.textAlignment = NSTextAlignmentCenter;
    headLineLabel.textColor = [UIColor customGrayColor];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:self.title];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor customBlueColor] range:NSMakeRange(1, 1)];
    headLineLabel.attributedText = attributedString;
    [headLineLabel sizeToFit];
    [self.navigationItem setTitleView:headLineLabel];

}
-(NSString *)titleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.items[indexPath.row]firstObject];

}
-(UIViewController *)viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [[self.items[indexPath.row]lastObject]new];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIndentifier forIndexPath:indexPath];
    cell.textLabel.text = [self.items[indexPath.row]firstObject];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIViewController *viewController = [self viewControllerForRowAtIndexPath:indexPath];
    viewController.title = [self titleForRowAtIndexPath:indexPath];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
