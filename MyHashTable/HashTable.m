//
//  HashTable.m
//  LLHashTable
//
//  Created by  Ricky Tsao on 9/22/16.
//  Copyright © 2016 Epam. All rights reserved.
//

#import "HashTable.h"
#import "LinkedList.h"

#define MAX_CAPACITIY 8

@interface HashTable () {
    
}

-(int)hash:(NSString*)itemKey;

@end



@implementation HashTable

-(instancetype) init {

    if([super init]) {
        
        self.hashArray = [[NSMutableArray alloc] initWithCapacity:MAX_CAPACITIY];
        
        for (int i = 0; i < MAX_CAPACITIY; i++) {
            [self.hashArray addObject:[[LinkedList alloc] init]];
        }
        
        NSLog(@"Hash Array set at %lu elements", [self.hashArray count]);
    }
    
    return self;
}

-(int)hash:(NSString*)itemKey {
    
//    int value = 0;
//    for ( int i = 0; i < itemKey.length(); i++ )
//        value += itemKey[i];
//    return (value * itemKey.length() ) % length;

    NSInteger value = 0;
    
    //1. get the length of the string key
    for (NSInteger i = 0; i < itemKey.length; i++) {
        
        //2. collect all the ascii value of the characters
        int ascii = (int)[itemKey characterAtIndex:i];
        value += ascii;
    }
    
    return (value * itemKey.length) % MAX_CAPACITIY;
}

-(void)insertItem:(NSString*)newKey {
    
    //first generate a hash from the key of the new item
    NSInteger index = [self hash:newKey];
    
    //then we use that hash key to know where in the array we start
    LinkedList * stack = (LinkedList*)[self.hashArray objectAtIndex:index];
    [stack push:newKey];
}

-(bool)removeItem:(NSString *) itemKey  {
    
    NSInteger index = [self hash:itemKey];
    LinkedList * stack = (LinkedList*)[self.hashArray objectAtIndex:index];
    return [stack remove:itemKey];
}


-(Node *)getItem:(NSString*)itemKey {

    int index = [self hash:itemKey];
    LinkedList * list = (LinkedList*)[self.hashArray objectAtIndex:index];
    return [list getElement:itemKey];
}

// Displays list contents to the console window.
-(void)printList {
    
    for ( int i = 0; i < [self.hashArray count]; i++) {
        LinkedList * stack = (LinkedList*)[self.hashArray objectAtIndex:i];
        NSLog(@"%d ===================================", i);
        [stack printHorizontal];
        NSLog(@"======================================\n\n");
    }
}

// Returns the length of the list.
-(NSInteger)getLength {
    return [self.hashArray count];
}

@end
