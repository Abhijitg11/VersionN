//
//  TableViewController1.m
//  JSONparsingpractice
//
//  Created by Student-004 on 12/01/17.
//  Copyright © 2017 abhijit. All rights reserved.
//

#import "TableViewController1.h"
#import "ViewController2.h"


@interface TableViewController1 ()

@end

@implementation TableViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    _arr=[[NSMutableArray alloc]init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    NSString *str=@"https://api.github.com/repos/crashlytics/secureudid/issues";
    NSURL *url=[NSURL URLWithString:str];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    NSURLSessionConfiguration *configuration=[NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSArray *outerarray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        for (NSDictionary *dict in outerarray)
        {
            _i1=[[issue alloc]init];
            _i1.title=[dict objectForKey:@"title"];
            _i1.body=[dict objectForKey:@"body"];
                NSDictionary *dict1=[dict objectForKey:@"user"];
            _i1.login=[dict1 objectForKey:@"login"];
            
            
            
            
            [_arr addObject:_i1];
            
            
        }
        [self.tableView reloadData];
    }];

    [task resume];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    issue *temp1=[_arr objectAtIndex:indexPath.row];
    cell.textLabel.text=temp1.title;
    
    
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
    controller.tempstring=temp2.body;
    controller.tempstring1=temp2.login;
    
    NSLog(@"%@",temp2.body);
    
    }
}

@end
