//
//  AddNewItem.m
//  Every.Do_main
//
//  Created by Sunny Surdhar on 2015-05-26.
//  Copyright (c) 2015 Sunny Surdhar. All rights reserved.
//

#import "AddNewItem.h"

@interface AddNewItem ()

@end

@implementation AddNewItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneAction:(UIBarButtonItem*)sender {

    NSString *priorityNumberInput = self.priorityNumberTextField.text;
    priorityNumberInput = [NSString stringWithFormat:@"%@", _priorityNumberTextField.text];
    
    Todo *newtask = [[Todo alloc]initWithTitle:self.titleTextField.text andWithDetails:self.detailsTextView.text andWithPriorityNumber:priorityNumberInput andWithIsCompleted:nil];
    
    //sending our 'pizza' to 'manager'
    [self.delegate addItemToArray:newtask];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelAction:(UIBarButtonItem*)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
