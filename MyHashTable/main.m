//
//  main.m
//  MyHashTable
//
//  Created by  Ricky Tsao on 9/22/16.
//  Copyright © 2016 Epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HashTable.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        HashTable * myTable = [[HashTable alloc] init];
        [myTable insertItem:@"Ricky Tsao"];
        [myTable insertItem:@"Ivan Kirkau"];
        
        [myTable insertItem:@"Luna Lin"];
        [myTable insertItem:@"Irving Zhao"];
        [myTable insertItem:@"Adam"];
        [myTable insertItem:@"Ken"];
        [myTable insertItem:@"Radhika Devhi"];
        [myTable insertItem:@"Genghis Khan"];
        
        [myTable insertItem:@"Jeremy Lin"];
        [myTable insertItem:@"Lu Zhang Yi"];
        [myTable insertItem:@"Sima Yi"];
        [myTable insertItem:@"Judy Zhou"];
        [myTable insertItem:@"Jim Zhang"];
        
        [myTable printList];
        
        NSString * inquiry = @"Radhika Devhi";
        
        if([myTable getItem:inquiry]) {
            [myTable removeItem:inquiry];
        }
        
        [myTable printList];
        
        char str[50] = {0};
        printf("\n -------INFO: Type a character to end terminal...----------\n\n");
        scanf("%s", str);
    }
    return 0;
}
