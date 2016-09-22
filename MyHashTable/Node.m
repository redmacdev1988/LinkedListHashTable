//
//  Node.m
//  LinkedListStack
//
//  Created by  Ricky Tsao on 9/19/16.
//  Copyright © 2016 Epam. All rights reserved.
//

#import "Node.h"

@implementation Node

-(instancetype)initWithData:(NSString*)newKey
                    andNext:(Node*)next {

    if ([super init] != nil) {
        
        self.key    = newKey;
        self.next   = next;
    }    
    return self;
}


@end
