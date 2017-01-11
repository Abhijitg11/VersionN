//
//  DataTAble.m
//  JSON assignment
//
//  Created by Student-001 on 15/12/16.
//  Copyright © 2016 Student-001. All rights reserved.
//
#import "TableViewControllersecond.h"
#import "DataTAble.h"

@interface DataTAble ()

@end

@implementation DataTAble

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array =[[NSMutableArray alloc]init];
    
    _mydata=[[NSMutableData alloc]init];
    
    NSString *str=@"https://api.github.com/repos/crashlytics/secureudid/issues";
    
    NSURL *url=[NSURL URLWithString:str];
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    [ NSURLConnection connectionWithRequest:request delegate:self];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    
    
    
    
    }


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    [_mydata setLength:0];
    
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [_mydata appendData:data];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSArray *arr =[NSJSONSerialization JSONObjectWithData:_mydata options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *dict in arr) {
        
        _i1=[[issue alloc]init];
        
        _i1.title=[dict objectForKey:@"title"];
        _i1.body=[dict objectForKey:@"body"];
        
       // NSString *str2=[dict objectForKey:@"body"];
        [_array addObject:_i1];
    
    }
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    issue *temp2=[_array objectAtIndex:indexPath.row];
    
    cell.textLabel.text=temp2.title;
    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [self performSegueWithIdentifier:@"fvctotvc" sender:nil];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {


if([segue.identifier isEqualToString:@"fvctotvc"]){
    
    
  //  issue *temp1=[_array objectAtIndex:indexPath.row];
    
    NSIndexPath *ip=[self.tableView indexPathForSelectedRow];
    
   // _i1=[_array objectAtIndex:inde];
    
   TableViewControllersecond  *controller=(TableViewControllersecond *)segue.destinationViewController;
    
    controller.tempstring=[_array objectAtIndex:ip.row];
    
    //controller.tempstring=
    //controller.tempstring=[_lablearray objectAtIndex:indexpath1.row];
    
    
    // NSLog(@"%@",controller);
    
}
    
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


//#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.



//}


@end
