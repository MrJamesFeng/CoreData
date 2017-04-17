//
//  FetchDataController.m
//  CoreData
//
//  Created by LDY on 17/4/17.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "FetchDataController.h"
#import "Student+CoreDataClass.h"
@interface FetchDataController ()<UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSFetchedResultsController *fetchedResultsController;

@end

@implementation FetchDataController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addData)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addData{
    @try {
        Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:kAppContext];
        student.name = @"James";
        student.age = 27;
        student.classes = [NSString stringWithFormat:@"%d",arc4random()%100];
        
        if (kAppContext.hasChanges) {
            [kAppDelegete saveContext];
        }
    } @catch (NSException *exception) {
        NSLog(@"func:%s,line:%d,exception:%@",__func__,__LINE__,exception);
    } @finally {
        
    }
   
}
#pragma mark-UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.fetchedResultsController.sections.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id<NSFetchedResultsSectionInfo>sectionInfo = self.fetchedResultsController.sections[section];
    return sectionInfo.numberOfObjects;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellWithIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cellWithIdentifier"];
    }
  
    
    [self updateCell:cell fetchedResultsController:indexPath];
    
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return <#expression#>
//}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
        {
           Student *student = [self.fetchedResultsController objectAtIndexPath:indexPath];
            [kAppContext deleteObject:student];
            if (kAppContext.hasChanges) {
                [kAppDelegete saveContext];
            }
        }
            break;
            
        case UITableViewCellEditingStyleInsert:
            
            break;
            
        default:
            break;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark- NSFetchedResultsControllerDelegate
-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    
    [self.tableView beginUpdates];
}
-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    NSLog(@"row=%ld section=%ld",(long)indexPath.row,(long)indexPath.section);
    switch (type) {
        case NSFetchedResultsChangeInsert:
//            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];//attempt to insert nil object from objects[0] with userInfo (null)
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeMove:
            [self.tableView moveRowAtIndexPath:indexPath toIndexPath:indexPath];
            break;
        case NSFetchedResultsChangeUpdate:
            [self updateCell:[self.tableView cellForRowAtIndexPath:indexPath] fetchedResultsController:indexPath];
            break;
            
        default:
            break;
    }

}
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
   //    [self.tableView reloadData];//beginUpdates没有endUpdates不更新
    [self.tableView endUpdates];
}
-(NSString *)controller:(NSFetchedResultsController *)controller sectionIndexTitleForSectionName:(NSString *)sectionName{
    return nil;
}
-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type{
    
}

-(void)updateCell:(UITableViewCell *)cell fetchedResultsController:(NSIndexPath *)indexPath{
    Student *student = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = student.name;
    cell.detailTextLabel.text = student.classes;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.allowsMultipleSelection = YES;
//        _tableView.directionalLockEnabled = YES;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
-(NSFetchedResultsController *)fetchedResultsController{
    if (!_fetchedResultsController) {
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
        
        //sortDescriptors required
        fetchRequest.sortDescriptors = @[sortDescriptor];
        fetchRequest.fetchLimit = 200;
        fetchRequest.fetchBatchSize = 20;
        
        _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:kAppContext sectionNameKeyPath:nil cacheName:@"StudentCach"];
        _fetchedResultsController.delegate = self;
        NSError *error = nil;
        [_fetchedResultsController performFetch:&error];
        if (error) {
            NSLog(@"func:%s,line:%d,error:%@",__func__,__LINE__,error);
        }
    }
    return _fetchedResultsController;
}

@end
