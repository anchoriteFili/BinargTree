//
//  BinaryTreeNode.m
//  二叉树test
//
//  Created by zetafin on 2018/3/23.
//  Copyright © 2018年 赵宏亚. All rights reserved.
//  https://www.jianshu.com/p/a270d117e116

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode


/*
 * 创建二叉排序树
 * 二叉排序树：左节点值全部小于根节点值，右节点值全部大于根节点值
 * @param values 数组
 * @return 二叉树根节点
 */
+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values {
    
    BinaryTreeNode *root = nil;
    
    for (NSInteger i = 0; i < values.count; i ++) {
        NSInteger value = [(NSNumber *)[values objectAtIndex:i] integerValue];
        root = [BinaryTreeNode addTreeNode:root value:value];
        
    }
    return root;
}

/*
 * 向二叉排序树节点添加一个节点
 * @param treeNode 根节点
 * @param value 值
 * @return 根节点
 */
+ (BinaryTreeNode *)addTreeNode:(BinaryTreeNode *)treeNOde value:(NSInteger)value {
    
    // 根节点不存在，创建节点
    if (!treeNOde) {
        treeNOde = [BinaryTreeNode new];
        treeNOde.value = value;
//        NSLog(@"node:%@",@(value));
    } else if (value <= treeNOde.value) {
//        NSLog(@"left: %@ -> %@", treeNOde.leftNode, @(value));
        treeNOde.leftNode = [BinaryTreeNode addTreeNode:treeNOde.leftNode value:value];
    } else {
//        NSLog(@"right: %@ -> %@", treeNOde.rightNode, @(value));
        // 值大于根节点，则插入到右子树
        treeNOde.rightNode = [BinaryTreeNode addTreeNode:treeNOde.rightNode value:value];
    }
    
    return treeNOde;
}

/*
 * 翻转二叉树（又叫：二叉树的镜像）
 * @prarm rootNode 根节点
 * @return 翻转后的树根节点（其实就是原二叉树的根节点）
 */
+ (BinaryTreeNode *)invertBinaryTree:(BinaryTreeNode *)rootNode {
    if (!rootNode) {
        return nil;
    }
    
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return rootNode;
    }
    
    [self invertBinaryTree:rootNode.leftNode];
    [self invertBinaryTree:rootNode.rightNode];
    
    BinaryTreeNode *tempNode = rootNode.leftNode;
    rootNode.leftNode = rootNode.rightNode;
    rootNode.rightNode = tempNode;
    
    return rootNode;
}

/*
 * 非递归方式翻转
 */
+ (BinaryTreeNode *)invertBinaryTreeNot:(BinaryTreeNode *)rootNode {
    
    if (!rootNode) {
        return nil;
    }
    
    if (!rootNode.rightNode && !rootNode.leftNode) {
        return rootNode;
    }
    
    NSMutableArray *queueArray = [NSMutableArray array]; // 数组当成队列
    
    [queueArray addObject:rootNode]; // 压入根节点
    
    while (queueArray.count > 0) {
        
        BinaryTreeNode *node = [queueArray firstObject];
        [queueArray removeObjectAtIndex:0]; // 弹出最前面的节点，仿照队列先进先出原则
        
        BinaryTreeNode *pLeft = node.leftNode;
        node.leftNode = node.rightNode;
        node.rightNode = pLeft;
        
        if (node.leftNode) {
            [queueArray addObject:node.leftNode];
        }
        
        if (node.rightNode) {
            [queueArray addObject:node.rightNode];
        }
    }
    
    return rootNode;
}


/**
 二叉树某个位置的节点（按层次遍历）

 @param index 按层次遍历树时的位置(从0开始算)
 @param rootNode 树根节点
 @return 节点
 */
+ (BinaryTreeNode *)treeNodeAtIndex:(NSInteger)index inTree:(BinaryTreeNode *)rootNode {
    
    // 按层次遍历
    if (!rootNode || index < 0) {
        return nil;
    }
    // 数组当成队列
    NSMutableArray *queueArray = [NSMutableArray array];
    // 压入根节点
    [queueArray addObject:rootNode];
    
    while (queueArray.count > 0) {
        BinaryTreeNode *node = [queueArray firstObject];
        if (index == 0) {
            return node;
        }
        
        [queueArray removeObjectAtIndex:0];
        index--;
        
        if (node.leftNode) {
            [queueArray addObject:node.leftNode];
        }
        if (node.rightNode) {
            [queueArray addObject:node.rightNode];
        }
    }
    return nil;
}


/**
 先序遍历：先访问根，再遍历左子树，再遍历右子树。典型的递归思想

 @param rootNode 根节点
 @param handler 访问节点处理函数
 */
+ (void)preOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void (^)(BinaryTreeNode *))handler {
    
    if (rootNode) {
        if (handler) {
            handler(rootNode);
        }
        
        [self preOrderTraverseTree:rootNode.leftNode handler:handler];
        [self preOrderTraverseTree:rootNode.rightNode handler:handler];
    }
}


/**
 中序遍历
 先遍历左子树，再访问根，再遍历右子树

 @param rootNode 根节点
 @param hadler 访问节点处理函数
 */
+ (void)inOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void (^)(BinaryTreeNode *))handler {
    
    if (rootNode) {
        [self inOrderTraverseTree:rootNode.leftNode handler:handler];
        if (handler) {
            handler(rootNode);
        }
        [self inOrderTraverseTree:rootNode.rightNode handler:handler];
    }
}



/**
 后续遍历
 先遍历左子树，再遍历右子树，再遍历根

 @param rootNode 根节点
 @param handler 访问节点处理函数
 */
+ (void)postOrderTraverseTree:(BinaryTreeNode *)rootNode handler:(void (^)(BinaryTreeNode *))handler {
    
    if (rootNode) {
        [self postOrderTraverseTree:rootNode.leftNode handler:handler];
        [self postOrderTraverseTree:rootNode.rightNode handler:handler];
        
        if (handler) {
            handler(rootNode);
        }
    }
}

+ (void)levelTraverseTree:(BinaryTreeNode *)rootNode handler:(void (^)(BinaryTreeNode *))handler {
    
    if (!rootNode) {
        return;
    }
    
    NSMutableArray *queueArray = [NSMutableArray array]; // 数组当成队列
    [queueArray addObject:rootNode];
    
    while (queueArray.count > 0) {
        BinaryTreeNode *node = [queueArray firstObject];
        if (handler) {
            handler(node);
        }
        
        [queueArray removeObjectAtIndex:0]; // 弹出最前面的节点，仿照队列先进先出原则
        
        if (node.leftNode) {
            [queueArray addObject:node.leftNode];
        }
        
        if (node.rightNode) {
            [queueArray addObject:node.rightNode];
        }
    }
}

// 二叉树的深度
+ (NSInteger)depathOfTree:(BinaryTreeNode *)rootNode {
    
    if (!rootNode) {
        return 0;
    }
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return 1;
    }
    
    // 左子树深度
    NSInteger leftDepth = [self depathOfTree:rootNode.leftNode];
    NSInteger rightDepth = [self depathOfTree:rootNode.rightNode];
    
    return MAX(leftDepth, rightDepth);
}


+ (NSInteger)widthOfTree:(BinaryTreeNode *)rootNode {
    
    if (!rootNode) {
        return 0;
    }
    
    NSMutableArray *queueArray = [NSMutableArray array];
    [queueArray addObject:rootNode];
    NSInteger maxWidth = 1; // 最大的宽度，初始化为1
    NSInteger curWidth = 0; // 当前层的宽度
    
    while (queueArray.count > 0) {
        curWidth = queueArray.count;
        
        // 依次弹出当前层的节点
        for (NSInteger i = 0; i < curWidth; i ++) {
            BinaryTreeNode *node = [queueArray firstObject];
            [queueArray removeObjectAtIndex:0];
            
            if (node.leftNode) {
                [queueArray addObject:node.leftNode];
            }
            if (node.rightNode) {
                [queueArray addObject:node.rightNode];
            }
        }
        maxWidth = MAX(maxWidth, queueArray.count);
    }
    return maxWidth;
}


/**
 二叉树的所有节点数

 @param rootNode 根节点
 @return 所有节点数
 */
+ (NSInteger)numberOfNodesInTree:(BinaryTreeNode *)rootNode {
    
    if (!rootNode) {
        return 0;
    }
    return [self numberOfNodesInTree:rootNode.leftNode] + [self numberOfNodesInTree:rootNode.rightNode] + 1;
}


/**
 二叉树某层中的节点数

 @param level 层
 @param rootNode 根节点
 @return 层中的节点数
 */
+ (NSInteger)numberOfNodesOnLevel:(NSInteger)level inTree:(BinaryTreeNode *)rootNode {
    
    if (!rootNode || level < 1) {
        return 0;
    }
    
    if (level == 1) {
        return 1;
    }
    
    return [self numberOfNodesOnLevel:level - 1 inTree:rootNode.leftNode] + [self numberOfNodesOnLevel:level - 1 inTree:rootNode.rightNode];
}


/**
 二叉树叶子节点数

 @param rootNode 根节点
 @return 叶子节点数
 */
+ (NSInteger)numberOfLeafsInTree:(BinaryTreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return 1;
    }
    
    return [self numberOfLeafsInTree:rootNode.leftNode] + [self numberOfLeafsInTree:rootNode.rightNode];
}


/**
 二叉树最大距离

 @param rootNode 根节点
 @return 最大距离
 */
+ (NSInteger)maxDistanceOfTree:(BinaryTreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    
    // 方案一：（递归次数较多，效率较低）
    // 分3种情况：
    // 1. 最远距离经过根节点：距离 = 左子树深度 + 右子树深度。
    NSInteger distance = [self depathOfTree:rootNode.leftNode] + [self depathOfTree:rootNode.rightNode];
    
    NSInteger disLeft = [self maxDistanceOfTree:rootNode.leftNode];
    NSInteger disRight = [self maxDistanceOfTree:rootNode.rightNode];
    
    return MAX(MAX(disLeft, disRight), distance);
}







@end
