//
//  Stack.m
//  LinkedListStack
//
//  Created by  Ricky Tsao on 9/19/16.
//  Copyright © 2016 Epam. All rights reserved.
//

#import "LinkedList.h"
#import "Node.h"

@interface LinkedList () {

    
}

@property (nonatomic, strong) Node * head;

@end

@implementation LinkedList

-(instancetype)init {

    if([super init]) {
        self.head = nil;
    }
    
    return self;
}


//O(1)
-(void)push:(NSString*)newData {

    self.head = [[Node alloc] initWithData:newData
                                   andNext:self.head];
}


//O(n)
-(Node*)getElement: (NSString*)existingData {
    
    for (Node * temp = self.head; temp != nil; temp = temp.next) {
        
        if ([temp.key compare:existingData] == NSOrderedSame) {
            NSLog(@"Found key {%@} in this list at node address %p", temp.key, temp);
            return temp;
        }
    }
    return nil;
}


//O(n)
-(BOOL)remove:(NSString*)existingData {
  
    Node * trailer, *temp;
    
    for (trailer = temp = self.head; temp != nil; trailer = temp, temp = temp.next) {
        
        if ([temp.key compare:existingData] == NSOrderedSame) {
            trailer.next = temp.next;
            temp = nil;
            return TRUE;
        }
    }
    
    //came out of the loop with nothing found
    return FALSE;
}


//O(n)
-(void)findString:(NSString*)dataToFind withCompletion:(void(^)(Node * result))complete {

    //traver through the list
    for (Node * temp = self.head; temp != nil; temp = temp.next) {
    
        if ([temp.key compare:dataToFind] == NSOrderedSame) {
            NSLog(@"Found key {%@} in this list at node address %p", temp.key, temp);
            //return temp;
            complete(temp);
            return;
        }
    }
    
    NSLog(@"{%@} was not found in this list", dataToFind);
}


//O(n)
-(void)printStack {
    
    NSLog(@"== top    of stack ==");
    for (Node * temp = self.head; temp != nil; temp = temp.next) {
        NSLog(@"|%@|", temp.key);
    }
    NSLog(@"== bottom of stack ==");
}

-(void)printHorizontal {
    
    NSMutableString * total = [NSMutableString string];
    
    for (Node * temp = self.head; temp != nil; temp = temp.next) {
        [total appendString:[NSString stringWithFormat:@"%@, ",temp.key]];
    }

    NSLog(@"%@", total);
}

-(NSInteger)count {
    NSInteger counter = 0;
    
    Node * temp = self.head;
    while(temp != nil) {
        temp = temp.next;
        counter++;
    }
    
    return counter;
}


@end
