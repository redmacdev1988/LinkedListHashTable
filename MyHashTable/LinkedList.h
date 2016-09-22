//
//  Stack.h
//  LinkedListStack
//
//  Created by  Ricky Tsao on 9/19/16.
//  Copyright © 2016 Epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface LinkedList : NSObject {
    
}

-(instancetype)init;

-(void)push:        (NSString*)newData;
-(BOOL)remove:      (NSString*)existingData;
-(Node*)getElement: (NSString*)existingData;


-(void)findString:(NSString*)dataToFind
   withCompletion:(void(^)(Node * result))complete;

-(void)printStack;
-(NSInteger)count;
-(void)printHorizontal;

@end
