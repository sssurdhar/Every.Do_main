//
//  Todo.m
//  Every.Do_main
//
//  Created by Sunny Surdhar on 2015-05-26.
//  Copyright (c) 2015 Sunny Surdhar. All rights reserved.
//

#import "Todo.h"

@implementation Todo


+(Todo *)defaultTodo {
    Todo *newTodo = [[self alloc] initWithTitle:@"Default title" andWithDetails:@"No details" andWithPriorityNumber:1 andWithIsCompleted:NO];
    return newTodo;
}


-(instancetype) initWithTitle:(NSString*)title andWithDetails:(NSString*)details andWithPriorityNumber:(int)priorityNumber andWithIsCompleted:(BOOL)isCompleted {
    self = [super init];
    if (self) {
        self.title = title;
        self.details = details;
        self.priorityNumber = priorityNumber;
        self.isCompleted = isCompleted;
    }
    return self;
}

@end
