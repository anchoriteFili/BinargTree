//
//  ViewController.m
//  二叉树test
//
//  Created by zetafin on 2018/3/23.
//  Copyright © 2018年 赵宏亚. All rights reserved.
//

#import "ViewController.h"
#import "BinaryTreeNode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *arr = [NSArray arrayWithObjects:@(7),@(6),@(3),@(2),@(1),@(9),@(10),@(12),@(14),@(4),@(14), nil];
    
    BinaryTreeNode *tree = [BinaryTreeNode new];
    tree = [BinaryTreeNode createTreeWithValues:arr];
    
    BinaryTreeNode *tree1 = [BinaryTreeNode treeNodeAtIndex:3 inTree:tree];
    NSLog(@"tree1: %@",tree1);
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
