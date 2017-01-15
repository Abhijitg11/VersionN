//
//  TableViewController1.m
//  JSONparsingpractice
//
//  Created by Student-004 on 12/01/17.
//  Copyright © 2017 abhijit. All rights reserved.
//

#import "TableViewController1.h"
#import "ViewController2.h"
#import <AFNetworking.h>

@interface TableViewController1 ()

@end

@implementation TableViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
   [self.tableView registerNib:[UINib nibWithNibName:@"customfirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self fetchIssue];
}

-(void) fetchIssue {
    [_indicator startAnimating];
    _api=[[Apicalls alloc]init];
    _arr=[[NSMutableArray alloc]init];
    
    [_api fetchIssues:^(NSObject *responseObject,NSError *error){
        [_indicator stopAnimating];
        
        if(error == nil){
            NSArray * responseArray=(NSArray *)responseObject;
            for(issue *obj in responseArray){
                [_arr addObject:obj];
            }
            [self.tableView reloadData];

        }else{
            NSLog(@"data failed to fetch");
        }
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    customfirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    issue *temp1=[_arr objectAtIndex:indexPath.row];
    NSString *stringb=temp1.body;
    if(stringb.length>140){
        stringb=[stringb substringToIndex:141];
        
    }
    cell.issuetitlelbl.text=temp1.title;
    cell.issuebodylbl.text=stringb;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"fvctotvc" sender:nil];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"fvctotvc"]){
      ViewController2 *controller=[segue destinationViewController];
    NSIndexPath *ip=[self.tableView indexPathForSelectedRow];
    
    issue *temp2=[_arr objectAtIndex:ip.row];
    controller.tempstring=temp2.commentsapi;
      NSLog(@"%@",temp2.body);
        NSLog(@"%@",temp2.commentsapi);
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
    
    

}


@end
