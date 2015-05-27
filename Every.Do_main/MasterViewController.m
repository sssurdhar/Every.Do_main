//
//  MasterViewController.m
//  Every.Do_main
//
//  Created by Sunny Surdhar on 2015-05-26.
//  Copyright (c) 2015 Sunny Surdhar. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "todoCell.h"
#import "AddNewItem.h"

@interface MasterViewController ()

@property NSMutableArray *todos;
//@property NSIndexPath *indexPath;


@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Todo *todo1 = [[Todo alloc] initWithTitle:@"Trash" andWithDetails:@"Take out the trash." andWithPriorityNumber:1 andWithIsCompleted:NO];
    Todo *todo2 = [[Todo alloc]initWithTitle:@"Homework" andWithDetails:@"Do Lighthouse Labs assignment." andWithPriorityNumber:2 andWithIsCompleted:NO];
    Todo *todo3 = [[Todo alloc]initWithTitle:@"Clean Apartment" andWithDetails:@"Vacum, dust and organize apartment." andWithPriorityNumber:3 andWithIsCompleted:YES];
    
    self.todos = [NSMutableArray arrayWithObjects:todo1, todo2, todo3, nil];
    
//    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.todos) {
        self.todos = [NSMutableArray alloc];
    }
    
    Todo* newTodo = [Todo new];
    newTodo.title = @"Title";
    newTodo.details = @"Details";
    
    [self.todos insertObject:newTodo atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Todo *task = self.todos[indexPath.row];
        [[segue destinationViewController] setDetailItem:task];
    } else if ([[segue identifier] isEqualToString:@"addNewItem"]) {
        AddNewItem *destination = segue.destinationViewController;
        destination.delegate = self;
        
        // get destination view ccontroller
        //pass the todos array to the destination view controller
        
    }
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    todoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Todo *task = self.todos[indexPath.row];
    cell.titleLabel.text = task.title;
    cell.detailsLabel.text = task.details;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%d", task.priorityNumber];
    
    
    
    if (task.isCompleted) {
        NSMutableAttributedString *strikeThrough = [[NSMutableAttributedString alloc] initWithString:task.title];
        [strikeThrough addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, self.title.length)];
        cell.titleLabel.attributedText = strikeThrough;
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma mark - AddNewItem Delegate

-(void)addItemToArray:(Todo*)newtask {
    [self.todos addObject:newtask];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.todos.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end










