//
//  ViewController.m
//  ContractNaviViewDevelopProject
//
//  Created by Ronaldinho on 15/8/2.
//  Copyright (c) 2015年 HotWordLand. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *constractView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constractTopSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lblTitleCenterY;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblContent;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if(([keyPath isEqualToString:@"contentOffset"])) {
        if (self.tableView.contentOffset.y > 136) {
            [self.constractTopSpace setConstant:-136];
            [self.lblTitleCenterY setConstant:-75];
            [self.lblTitle setTransform:CGAffineTransformMakeScale(0.8,0.8)];
            [self.lblContent setAlpha:0];

            return;
        }
        if (self.tableView.contentOffset.y < 0) {
            [self.constractTopSpace setConstant:0];
            [self.lblTitleCenterY setConstant:0];
            [self.lblTitle setTransform:CGAffineTransformIdentity];
            [self.lblContent setAlpha:1];
            return;
        }
        if (self.tableView.contentOffset.y == 0) {
            [self.lblTitle setTransform:CGAffineTransformIdentity];
            [self.lblContent setAlpha:1];

        }
        if (self.tableView.contentOffset.y > 10) {
            [self.view bringSubviewToFront:self.constractView];
        }
       
        [self.constractTopSpace setConstant:-self.tableView.contentOffset.y];
        [self.lblTitleCenterY setConstant:-self.tableView.contentOffset.y/1.8133];
        [self.lblTitle setTransform:CGAffineTransformMakeScale(1-(0.0015 * self.tableView.contentOffset.y), 1-(0.0015 * self.tableView.contentOffset.y))];
        [self.lblContent setAlpha:1-(self.tableView.contentOffset.y * 0.00735)];
        

        
//        if (_scrollView.contentOffset.y + _scrollView.frame.size.height > _scrollView.contentSize.height - _distanceFromBottomToReload) {
//            if (self.refreshBlock) {
//                self.refreshBlock(_scrollView,YES);
//            }
//        }else if(_scrollView.contentOffset.y < _distanceFromTopToReload){
//            if (self.refreshBlock) {
//                self.refreshBlock(_scrollView,NO);
//            }
//        }
    }
}
#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        
        if(cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
//        [cell.contentView setBackgroundColor:[UIColor clearColor]];
//        [cell.contentView setAlpha:0];
        [cell setBackgroundColor:[UIColor clearColor]];
        return cell;

    }
    
    static NSString *cellIdentifier = @"cardcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
//    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 200;
    }
    return 226;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
