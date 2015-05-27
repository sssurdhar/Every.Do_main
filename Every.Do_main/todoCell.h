//
//  todoCell.h
//  Every.Do_main
//
//  Created by Sunny Surdhar on 2015-05-26.
//  Copyright (c) 2015 Sunny Surdhar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface todoCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *priorityLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailsLabel;

@end
