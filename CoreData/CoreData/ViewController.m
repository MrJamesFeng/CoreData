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
#import "Headmaster+CoreDataClass.h"
#import "ClassRoom+CoreDataClass.h"
#import "Teacher+CoreDataClass.h"
#import "Student+CoreDataClass.h"
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

//        [self relationships2];
        
//        [self deleteData1];
        
//        [self deleteData2];
        
        [self fetchWithEntityName:school managedObjectContext:kAppContext];
        
        
        
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
                for (Headmaster *h in gra.gradeToheadmaster) {
                    NSLog(@"%@",h.name);
                    for (Student *stu in h.headmasterToclass.classToStudent) {
                        NSLog(@"Headmaster = name =%@,age = %d",stu.name,stu.age);
                        if (stu.age ==0) {
                            stu.age = 19;
                        }
                    }
                }
                for (Headmaster *h in gra.gradeToheadmaster) {
                    for (Teacher *t in h.headmasterToclass.classToTeacher) {
                        NSLog(@"name =%@,age = %@",t.name,t.course);
                    }
                }
 
            }
        }
        if (kAppContext.hasChanges) {
            [kAppDelegete saveContext];
        }
//        NSLog(@"executeFetchRequest results = %@",results);
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
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Grades"];
    NSError *error = nil;
    NSArray<Grades *>*results = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"error=%@",error);
    }
//    for (School *sch in results) {
//        //给深圳外国语学校增加班级66 88
//        if ([sch.name isEqualToString:@"深圳外国语学校"]) {
//            Grades *gra66 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
//            gra66.no = 66;
//            Grades *gra88 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
//            gra88.no = 88;
//            [sch addShcoolToGrad:[NSSet setWithObjects:gra88,gra66, nil]];
//        }
//        //给QingHuaMiddleSchool增加班级99 77
//        if ([sch.name isEqualToString:@"QingHuaMiddleSchool"]) {
//            Grades *gra99 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
//            gra99.no = 99;
//            Grades *gra77 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
//            gra77.no = 77;
//            [sch addShcoolToGrad:[NSSet setWithObjects:gra99,gra77, nil]];
//        }
//    }
    
    //给88增加headmaster88 teacher 881 882 student 991 992
    for (Grades *gra in results) {
        
        if (gra.no == 88) {
            @try {
                Headmaster *h88 = [NSEntityDescription insertNewObjectForEntityForName:@"Headmaster"  inManagedObjectContext:kAppContext];
                h88.name = @"H88";
                //添加headteacher
                [gra addGradeToheadmaster:[NSSet setWithObject:h88]];
                
                //分配班级
                ClassRoom *classRoom = [NSEntityDescription insertNewObjectForEntityForName:@"ClassRoom" inManagedObjectContext:kAppContext];
                classRoom.no = 308;
                h88.headmasterToclass = classRoom;//一对一
                
                //添加学生
                Student *stu1 = [NSEntityDescription insertNewObjectForEntityForName:@"Student"  inManagedObjectContext:kAppContext];
                stu1.classes = @"cla308";
                stu1.name = @"STU881";
                Student *stu2 = [NSEntityDescription insertNewObjectForEntityForName:@"Student"  inManagedObjectContext:kAppContext];
                stu2.name = @"STU882";
                stu2.classes = @"cla308";
                [classRoom addClassToStudent:[NSSet setWithObjects:stu1,stu2, nil]];
                
                //添加老师
                Teacher *t1 = [NSEntityDescription insertNewObjectForEntityForName:@"Teacher"  inManagedObjectContext:kAppContext];
                t1.name = @"T991";
                t1.course = @"couse308";
                
                Teacher *t2 = [NSEntityDescription insertNewObjectForEntityForName:@"Teacher"  inManagedObjectContext:kAppContext];
                t2.name = @"T991";
                t2.course = @"couse308";
                [classRoom addClassToTeacher:[NSSet setWithObjects:t1,t2, nil]];

            } @catch (NSException *exception) {
                NSLog(@"exception =%@",exception);
            } @finally {
                NSLog(@"break");
                
            }
            
        }
    }
    
    [kAppDelegete saveContext];
    
//    [self fetchWithEntityName:school managedObjectContext:kAppContext];
    }
#pragma mark- 删除
//测试deny  Items cannot be deleted from classToheadmaster.
-(void)deleteData1{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"ClassRoom"];
    NSError *error = nil;
    NSArray<ClassRoom *> *results = [kAppContext executeFetchRequest:fetchRequest error:&error];
    for (ClassRoom *c in results) {
        @try {
            [kAppContext deleteObject:c ];
        } @catch (NSException *exception) {
            NSLog(@"exception = %@",exception);
        } @finally {
            
        }
    }
    if (kAppContext.hasChanges) {
        [kAppDelegete saveContext];
    }
//     [self fetchWithEntityName:school managedObjectContext:kAppContext];
}
//测试 cascade
-(void)deleteData2{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"ClassRoom"];
    NSError *error = nil;
    NSArray<ClassRoom *> *results = [kAppContext executeFetchRequest:fetchRequest error:&error];
    for (ClassRoom *c in results) {
        @try {
            [kAppContext deleteObject:c ];
        } @catch (NSException *exception) {
            NSLog(@"exception = %@",exception);
        } @finally {
            
        }
    }
    if (kAppContext.hasChanges) {
        [kAppDelegete saveContext];
    }
         [self fetchWithEntityName:school managedObjectContext:kAppContext];
}
@end
