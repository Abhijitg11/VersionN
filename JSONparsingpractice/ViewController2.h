//
//  ViewController2.h
//  JSONparsingpractice
//
//  Created by Student-004 on 14/01/17.
//  Copyright © 2017 abhijit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customsecondTableViewCell.h"
#import "comments.h"
#import "Apicalls.h"


@interface ViewController2 : UITableViewController
@property(nonatomic,retain)NSString *tempstring;
@property(nonatomic,retain)NSMutableArray *arr2;
@property(nonatomic,retain)comments *c1;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic,retain)Apicalls *api;

@end
