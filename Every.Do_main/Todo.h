//
//  Todo.h
//  Every.Do_main
//
//  Created by Sunny Surdhar on 2015-05-26.
//  Copyright (c) 2015 Sunny Surdhar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* details;
@property (assign) int priorityNumber;
@property (assign) BOOL isCompleted;

+(Todo *)defaultTodo;


-(instancetype) initWithTitle:(NSString*)title andWithDetails:(NSString*)details andWithPriorityNumber:(int)priorityNumber andWithIsCompleted:(BOOL)isCompleted;

@end
