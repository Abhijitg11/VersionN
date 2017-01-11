//
//  DataTAble.h
//  JSON assignment
//
//  Created by Student-001 on 15/12/16.
//  Copyright © 2016 Student-001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataTAble : UITableViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

@property(nonatomic,retain)NSMutableArray *array;

@property(nonatomic,retain)NSMutableData *mydata;
@property(nonatomic,retain)issue *i1;


@end
