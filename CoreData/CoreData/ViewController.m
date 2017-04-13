//
//  ViewController.m
//  CoreData
//
//  Created by LDY on 17/4/12.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

#define kSchool @"QingHuaMiddleSchool"
#define school @"School"

#define grade @"Grades"
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self testPerson];
//    [self insertNewObjectForEntityForName:grade value:@(1) key:@"no" managedObjectContext:kAppContext];
//    [kAppDelegete saveContext];
//    NSError *error = nil;
//    [kmanagedObjectContext save:&error];
//    if (error) {
//        NSLog(@"save error = %@",error);
//    }
    [self fetchWithEntityName:grade managedObjectContext:kAppContext];
}
-(void)insertNewObjectForEntityForName:(NSString *)name value:(id)value key:(id)key managedObjectContext:(NSManagedObjectContext *)managedObjectContext{

    NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:managedObjectContext];
    
    [managedObject setValue:value forKey:key];

}
-(void)modifyWithEntityName:(NSString *)entityName predicate:(NSString *)predicate managedObjectContext:(NSManagedObjectContext *)managedObjectContext{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:entityName];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"no=",predicate];
    fetchRequest.predicate = pred;
    NSError *error = nil;
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"executeFetchRequest error = %@",error);
    }else{
        NSLog(@"executeFetchRequest results = %@",results);
    }
    
    
    
}
-(void)fetchWithEntityName:(NSString *)entityName managedObjectContext:(NSManagedObjectContext *)managedObjectContext{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:entityName];
    NSError *error = nil;
    
    NSArray *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"executeRequest error = %@",error);
    }else{
        NSLog(@"executeFetchRequest results = %@",results);
    }
    
}
/*测试userDefault <NSCoding>*/
-(void)testPerson{
    Person *person = [Person new];
    person.name = @"James";
    person.age = 27;
    person.height = 168.8;
    [[NSUserDefaults standardUserDefaults]setObject:person forKey:@"person"];//[User Defaults] Attempt to set a non-property-list
    //NSUserDefaults只能保存NSString, NSNumber, NSDate, NSArray, NSDictionary
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
