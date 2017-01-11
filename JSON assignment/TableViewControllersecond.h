//
//  TableViewControllersecond.h
//  JSON assignment
//
//  Created by Student-001 on 11/01/17.
//  Copyright © 2017 Student-001. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "issue.h"

@interface TableViewControllersecond : UITableViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

@property(nonatomic,retain)NSString  *tempstring;




@property(nonatomic,retain)NSMutableArray *array;

@property(nonatomic,retain)NSMutableData *mydata;


@end
