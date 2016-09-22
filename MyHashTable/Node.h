//
//  Node.h
//  LinkedListStack
//
//  Created by  Ricky Tsao on 9/19/16.
//  Copyright © 2016 Epam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject {
    
}

@property (nonatomic, strong) NSString * key;
@property (nonatomic, strong) Node * next;

-(instancetype)initWithData:(NSString*)newKey
                    andNext:(Node*)next;

@end
