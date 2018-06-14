//
//  HashTable.h
//  LLHashTable
//
//  Created by  Ricky Tsao on 9/22/16.
//  Copyright © 2016 Epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface HashTable : NSObject
{
    
}

@property (nonatomic, strong) NSMutableArray * hashArray;


-(void)insertItem:(NSString*)newKey;
-(bool)removeItem:(NSString *)itemKey;

-(Node *)getItem:(NSString*)itemKey;

// Displays list contents to the console window.
-(void)printList;

// Returns the length of the list.
-(NSInteger)getLength;

@end
