//
//  ResponeParser.h
//  JSONparsingpractice
//
//  Created by Admin on 1/15/17.
//  Copyright © 2017 abhijit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "issue.h"
#import "comments.h"

@interface ResponeParser : NSObject

-(NSArray *)parseIssueObject : (NSDictionary *)response;
-(NSArray *)parseCommentObject : (NSDictionary *)response;
@property(nonatomic,retain) issue *issue;
@property(nonatomic,retain) comments *comments;
@property(nonatomic,retain) NSMutableArray *arr;
@end
