//
//  ViewController.m
//  CoreData
//
//  Created by LDY on 17/4/12.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "School+CoreDataClass.h"
#import "Grades+CoreDataClass.h"
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
    
    @try {
//        [self relationships1];

        [self relationships2];
        
    } @catch (NSException *exception) {
        NSLog(@"exception = %@",exception);
    } @finally {
        NSLog(@"try--->");
    }
    
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
    NSArray<School *> *results = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"executeRequest error = %@",error);
    }else{
        for (School *sch in results) {
            NSLog(@"sch=%@",sch.name);
            for (Grades *gra in sch.shcoolToGrad) {
                NSLog(@"gra=%d",gra.no);
            }
        }
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

-(void)addSingleEntity{
//    [self insertNewObjectForEntityForName:grade value:@(1) key:@"no" managedObjectContext:kAppContext];
//    School *sch = [NSEntityDescription insertNewObjectForEntityForName:school inManagedObjectContext:kAppContext];
    //        sch.name = kSchool;
    //        [self fetchWithEntityName:school managedObjectContext:kAppContext];
    
    //grade
    //        Grades *grd = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
    //        grd.no = 8;
    //        [self fetchWithEntityName:@"Grades" managedObjectContext:kAppContext];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- 关联关系
-(void)relationships1{
    //创建的时候添加关联关系
    School *sch = [NSEntityDescription insertNewObjectForEntityForName:@"School" inManagedObjectContext:kAppContext];
    sch.name = @"深圳外国语学校";
    
    Grades *gra1 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
    gra1.no = 12;
    
    Grades *gra2 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
    gra2.no = 12;
    [sch addShcoolToGrad:[NSSet setWithObjects:gra1,gra2, nil]];
    
    [kAppDelegete saveContext];
}
//给已存在的对象添加关联对象
-(void)relationships2{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:school];
    NSError *error = nil;
    NSArray<School *>*results = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"error=%@",error);
    }
    for (School *sch in results) {
        //给深圳外国语学校增加班级66 88
        if ([sch.name isEqualToString:@"深圳外国语学校"]) {
            Grades *gra66 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
            gra66.no = 66;
            Grades *gra88 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
            gra88.no = 88;
            [sch addShcoolToGrad:[NSSet setWithObjects:gra88,gra66, nil]];
        }
        //给QingHuaMiddleSchool增加班级99 77
        if ([sch.name isEqualToString:@"QingHuaMiddleSchool"]) {
            Grades *gra99 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
            gra99.no = 99;
            Grades *gra77 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
            gra77.no = 77;
            [sch addShcoolToGrad:[NSSet setWithObjects:gra99,gra77, nil]];
        }
    }
    
    [kAppDelegete saveContext];
    
    [self fetchWithEntityName:school managedObjectContext:kAppContext];
    }

@end
