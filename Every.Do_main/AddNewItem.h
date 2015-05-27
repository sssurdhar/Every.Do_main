//
//  AddNewItem.h
//  Every.Do_main
//
//  Created by Sunny Surdhar on 2015-05-26.
//  Copyright (c) 2015 Sunny Surdhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol AddNewItemDelegate <NSObject>

@required

-(void)addItemToArray:(Todo*)newtask;

@end

@interface AddNewItem : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityNumberTextField;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextView;

@property (nonatomic) id <AddNewItemDelegate> delegate;

@end
