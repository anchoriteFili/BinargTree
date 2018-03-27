//
//  BinaryTreeNode.h
//  二叉树test
//
//  Created by zetafin on 2018/3/23.
//  Copyright © 2018年 赵宏亚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject

@property (nonatomic,assign) NSInteger value;
@property (nonatomic,strong) BinaryTreeNode *leftNode;  // 左子树
@property (nonatomic,strong) BinaryTreeNode *rightNode; // 右子树

// 创建二叉树
+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values;

// 二叉树中某个位置的节点(按层次遍历)
+ (BinaryTreeNode *)treeNodeAtIndex:(NSInteger)index inTree:(BinaryTreeNode *)rootNode;

// 向二叉排序树节点添加一个节点
+ (BinaryTreeNode *)addTreeNode:(BinaryTreeNode *)treeNOde value:(NSInteger)value;

// 翻转二叉树
+ (BinaryTreeNode *)invertBinaryTree:(BinaryTreeNode *)rootNode;

// 非递归方式翻转
+ (BinaryTreeNode *)invertBinaryTreeNot:(BinaryTreeNode *)rootNode;

// 先序遍历：先访问跟，再遍历左子树，再遍历右子树。典型的递归思想。
+ (void)preOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *))handler;

// 中序遍历：先遍历左子树，再访问根，再遍历右子树
+ (void)inOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handler;

// 后续遍历：先遍历左子树，再遍历右子树，在访问根
+ (void)postOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handler;

// 层次遍历（广度优先）
+ (void)levelTraverseTree:(BinaryTreeNode *)rootNode handler:(void(^)(BinaryTreeNode *treeNode))handler;

// 二叉树的宽度
+ (NSInteger)widthOfTree:(BinaryTreeNode *)rootNode;

// 二叉树所有节点数
+ (NSInteger)numberOfNodesInTree:(BinaryTreeNode *)rootNode;

// 二叉树某层中的节点数
+ (NSInteger)numberOfNodesOnLevel:(NSInteger)level inTree:(BinaryTreeNode *)rootNode;

// 二叉树子节点数
+ (NSInteger)numberOfLeafsInTree:(BinaryTreeNode *)rootNode;

// 二叉树最大距离（直接）
+ (NSInteger)maxDistanceOfTree:(BinaryTreeNode *)rootNode;




@end
