//
//  ResponeParser.m
//  JSONparsingpractice
//
//  Created by Admin on 1/15/17.
//  Copyright © 2017 abhijit. All rights reserved.
//

#import "ResponeParser.h"

@implementation ResponeParser

-(NSArray *)parseIssueObject:(NSDictionary *)response {
    
   _arr = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in response){
            _issue=[[issue alloc]init];
            _issue.title=[dict objectForKey:@"title"];
            NSLog(@"title %@", _issue.title);
            _issue.body=[dict objectForKey:@"body"];
            _issue.commentsapi=[dict objectForKey:@"comments_url"];
            [_arr addObject:_issue];
        }
    
    return _arr;
}

-(NSArray *)parseCommentObject : (NSDictionary *)response{
    
    _arr=[[NSMutableArray alloc]init];
    for (NSDictionary *dict in response){
        _comments=[[comments alloc]init];
        _comments.commentbody=[dict objectForKey:@"body"];
        NSLog(@"comment body: %@", _comments.commentbody);
        NSDictionary *dict1=[dict objectForKey:@"user"];
        _comments.commentauthor=[dict1 objectForKey:@"login"];
        
        [_arr addObject:_comments];
        
}
    return _arr;
}


@end
