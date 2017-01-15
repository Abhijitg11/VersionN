//
//  TableViewController1.h
//  JSONparsingpractice
//
//  Created by Student-004 on 12/01/17.
//  Copyright © 2017 abhijit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customfirstTableViewCell.h"
#import "issue.h"
#import "Apicalls.h"

@interface TableViewController1 : UITableViewController
@property(nonatomic,retain)NSMutableArray *arr;
@property(nonatomic,retain)issue *i1;
@property(nonatomic,retain)Apicalls *api;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;



//@property(nonatomic,retain)dispatch_queue_t queue;


@end
