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
#import "FetchDataController.h"
#import "UserInfo+CoreDataClass.h"
#import "Student1+CoreDataClass.h"
@interface ViewController ()

@end

@implementation ViewController

#define kSchool @"QingHuaMiddleSchool"

#define school @"School"

#define grade @"Grades"
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    NSManagedObjectContextWillSaveNotification
//    NSManagedObjectContextDidSaveNotification
//    NSManagedObjectContextObjectsDidChangeNotification
    
    //数据保存完毕后接受通知更新UI
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveContextSave:) name:NSManagedObjectContextDidSaveNotification object:nil];
    // Do any additional setup after loading the view, typically from a nib.
//    [self testPerson];
    
    @try {
//        [self addSingleEntity];
//        [self relationships1];

//        [self relationships2];
        
//        [self deleteData1];
        
//        [self deleteData2];
        
//        [self fetchWithEntityName:school managedObjectContext:kAppContext];
        
//        [self deleteShool];
        
//        [self fetchWithConditions1];
//        [self fetchCondition3];      
        
//        [self fectchCondition4];
        
//        [self fetchCondition5];
        
//        [self fetchCondition6];
        
//        [self fetchCondition7];
        
//        [self updateDatas1];
        
//        [self batchDelte];
        
//        [self asyc];
        
//        [self testVersion1];
        
//        [self testVersion2];
        
        
        
        
    } @catch (NSException *exception) {
        NSLog(@"exception = %@ line:%d",exception,__LINE__);
    } @finally {
        NSLog(@"try--->");
    }
    
    
//    [self testArr];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(fetchData)];
    
}
//版本升级:更改实体名称名，增加属性
-(void)testVersion2{
    
    /*
    Student1 *st1 = [NSEntityDescription insertNewObjectForEntityForName:@"Student1" inManagedObjectContext:kAppContext];
    st1.name = @"新的stu";
    st1.age = 18;
    st1.addAttribute = @"addAttribute";
    st1.classes = @"classes";
    st1.icon = [UIImage imageNamed:@"icon3"];
    if (kAppContext.hasChanges) {
        [kAppDelegete saveContext];
    }
     */
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student1"];
    NSError *error = nil;
    NSArray<Student1 *>*stus = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"error=%@",error);
    }else{
        for (Student1 *stu in stus) {
            NSLog(@"name=%@ addAttribute=%@",stu.name,stu.addAttribute);
            /*
            2017-04-20 15:07:11.408721 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.408801 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.408847 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.408889 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.408928 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.408969 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409032 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409110 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409155 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409231 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409310 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409369 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409527 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409585 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409658 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409713 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409755 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409828 CoreData[2652:680891] name=James addAttribute=(null)
            2017-04-20 15:07:11.409890 CoreData[2652:680891] name=新的stu addAttribute=addAttribute
             */
            //--->迁移成功:旧数据没有丢失，新数据添加成功！
        }
    }
}
//版本升级:新增一个类（表）不用做版本迁移
-(void)testVersion1{
    UserInfo *user = [NSEntityDescription insertNewObjectForEntityForName:@"UserInfo" inManagedObjectContext:kAppContext];
    user.title = @"duser新增";
    user.birthday = [NSDate date];
    user.icon = [UIImage imageNamed:@"icon2"];
    user.attrAdded = @"这是一个新增属性";//The managed object model version used to open the persistent store is incompatible with the one that was used to create the persistent store.
    if (kAppContext.hasChanges) {
        [kAppDelegete saveContext];
    }
    NSFetchRequest *fetchRequest = [UserInfo fetchRequest];
    NSError *error = nil;
    NSArray<UserInfo *>*userInfos = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"func:%s line:%d error:%@",__func__,__LINE__,error);
    }
    for (UserInfo *userInfo in userInfos) {
        NSLog(@"title:%@ icon:%@",userInfo.title,userInfo.icon);
    }
    
}
-(void)fetchData{
    FetchDataController *fetchVC = [[FetchDataController alloc]init];
    [self.navigationController pushViewController:fetchVC animated:YES];                   
}
- (void)receiveContextSave:(NSNotification *)note {
    [kAppContext mergeChangesFromContextDidSaveNotification:note];
    
//    注意：通知的 userInfo 里保存的 managedObjects 不可以直接在另一个线程的 context 中直接使用！也就是 managedObject 不是跨线程的，如果想要在别的线程操作，必须通过 objectId 在另一个 context 里再重新获得这个 object。
//kAppContext(NSMainQueueConcurrencyType)要获取kmanagedObjectContext(NSPrivateQueueConcurrencyType)修改的数据必须先获取kmanagedObjectContext传过来的objectId，然后再通过objectId去获取
//    [kmanagedObjectContext objectWithID:<#(nonnull NSManagedObjectID *)#>];
    

}

-(void)testArr{
    Person *p1 = [Person new];
    p1.name = @"AAA";
    p1.age = 20;
    p1.height = 172;
    
    Person *p2 = [Person new];
    p2.name = @"BB";
    p1.age = 22;
    p1.height = 176;
    NSArray *arr =@[p1,p2];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age<%d",24];
    NSLog(@"%@",[arr filteredArrayUsingPredicate:predicate]);
}
-(void)testManageID{
//    url ？
//    NSManagedObjectID *objectID = [kAppContext.persistentStoreCoordinator managedObjectIDForURIRepresentation:<#(nonnull NSURL *)#>];
//    [kAppContext objectWithID:<#(nonnull NSManagedObjectID *)#>];
}
#pragma mark- test NSPrivateQueueConcurrencyType
-(void)testPrivateQueueConcurrencyType{
    //私有队列后台异步执行
    [kmanagedObjectContext performBlock:^{
        
    }];
    
    //私有队列后台同步执行
    [kmanagedObjectContext performBlockAndWait:^{
        
    }];
    
    NSError *error = nil;
    //后台处理完毕数据后发出通知，通过mergeChangesFromContextDidSaveNotification:note在context将数据合并到主线程
    [kmanagedObjectContext save:&error];
}
-(void)testValidate{
    School *sch = [NSEntityDescription insertNewObjectForEntityForName:@"School" inManagedObjectContext:kAppContext];
    sch.name = @"深圳外国语学校";
//    [sch validateValue:<#(id  _Nullable __autoreleasing * _Nonnull)#> forKey:<#(nonnull NSString *)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>];
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
//简单查询
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
                NSLog(@"gra.no=%d",gra.no);
                for (Headmaster *h in gra.gradeToheadmaster) {
                    NSLog(@"h.name=%@",h.name);
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
//单条件查询
-(void)fetchWithConditions1{
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:school];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@",@"深圳外国语学校"];
    fetchRequest.predicate = predicate;
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    fetchRequest.sortDescriptors = @[sortDescriptor];
    NSError *error = nil;
    NSArray <School *>*schs = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
//    for (School *sch in schs) {
//        NSLog(@"sch.name=%@",sch.name);
//    }
    [schs enumerateObjectsUsingBlock:^(School * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"sch.name=%@",obj.name);
//        if (idx == 1) {
//            *stop = YES;
//        }
        [obj.shcoolToGrad enumerateObjectsUsingBlock:^(Grades * _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"obj.no = %d",obj.no);
        }];
    }];
}

//多条件查询 限制条件school+grade.no ?
-(void)fetchCondition2{
    
}
//分页查询
-(void)fetchCondition3{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:school];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name=%@",@"深圳外国语学校"];
    fetchRequest.predicate = predicate;
    
    fetchRequest.fetchOffset = 2;//从第2个开始查询 = pageNo
    fetchRequest.fetchLimit = 2;//每次查询个数 = count
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    fetchRequest.sortDescriptors = @[sortDescriptor];
    NSError *error = nil;
    NSArray <School *>*schs = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    //    for (School *sch in schs) {
    //        NSLog(@"sch.name=%@",sch.name);
    //    }
    [schs enumerateObjectsUsingBlock:^(School * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"sch.name=%@",obj.name);
        //        if (idx == 1) {
        //            *stop = YES;
        //        }
        [obj.shcoolToGrad enumerateObjectsUsingBlock:^(Grades * _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"obj.no = %d",obj.no);
        }];
    }];

}
//模糊查询
-(void)fectchCondition4{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:school];
    //匹配
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name LIKE %@",@"*深圳*"];//查询所有包涵"深圳"的School
    //包含
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains %@",@"深圳"];
    //开头
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name BEGINSWITH %@",@"Qing"];
    //结尾
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name endswith %@",@"学校"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains %@",@"深圳"];
    fetchRequest.predicate = predicate;

    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    fetchRequest.sortDescriptors = @[sortDescriptor];
    NSError *error = nil;
    NSArray <School *>*schs = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    //    for (School *sch in schs) {
    //        NSLog(@"sch.name=%@",sch.name);
    //    }
    [schs enumerateObjectsUsingBlock:^(School * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"sch.name=%@",obj.name);
        //        if (idx == 1) {
        //            *stop = YES;
        //        }
        [obj.shcoolToGrad enumerateObjectsUsingBlock:^(Grades * _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"obj.no = %d",obj.no);
        }];
    }];
}
//根据模版查询
-(void)fetchCondition5{
    //MOC
    NSManagedObjectModel *managedObjectModel = kAppContext.persistentStoreCoordinator.managedObjectModel;
    
    //FetchRequest
    NSFetchRequest *fetchRequest = [managedObjectModel fetchRequestTemplateForName:@"school"];
    
    NSError *error = nil;

    NSArray<School *>*schs = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"line:%d func:%s  error:%@",__LINE__,__func__,error);
    }
    [schs enumerateObjectsUsingBlock:^(School * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"name=%@",obj.name);
    }];
    
}
//查询数据条数
-(void)fetchCondition6{
//
//    //MOC
//    NSManagedObjectModel *managedObjectModel = kAppContext.persistentStoreCoordinator.managedObjectModel;
//    
//    //FetchRequest
//    NSFetchRequest *fetchRequest = [managedObjectModel fetchRequestTemplateForName:@"school"];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:school];//Can't modify a named fetch request in an immutable model --->不能使用模版查询
    
    fetchRequest.resultType =  NSCountResultType;
    
    NSError *error = nil;
    
    NSArray *results = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"line:%d func:%s  error:%@",__LINE__,__func__,error);
    }
    NSLog(@"results = %@",results);
//    results = (
//               5
//               )
    
}

//位运算:计算年龄总和
-(void)fetchCondition7{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    fetchRequest.resultType = NSDictionaryResultType;
    
    NSExpressionDescription *expressionDescription = [[NSExpressionDescription alloc]init];
    expressionDescription.name = @"sumAge";
    expressionDescription.expressionResultType = NSFloatAttributeType;
    
    NSExpression *expression = [NSExpression expressionForFunction:@"sum:" arguments:@[[NSExpression expressionForKeyPath:@"age"]]];
    expressionDescription.expression = expression;
    fetchRequest.propertiesToFetch = @[expressionDescription];
    
    NSError *error = nil;
    NSArray*students = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        if (error) {
            NSLog(@"line:%d func:%s  error:%@",__LINE__,__func__,error);
        }
    }
    NSLog(@"students = %@",students);
}
//批量更新
-(void)updateDatas1{
    NSBatchUpdateRequest *batchUpdateRequest = [NSBatchUpdateRequest batchUpdateRequestWithEntityName:@"Student"];
    batchUpdateRequest.resultType = NSUpdatedObjectsCountResultType;
    batchUpdateRequest.propertiesToUpdate = @{@"age":[NSNumber numberWithInteger:25]};
    NSError *error = nil;
    NSBatchUpdateResult *batchUpdateResult = [kAppContext executeRequest:batchUpdateRequest error:&error];
    if (error) {
        NSLog(@"line:%d func:%s  error:%@",__LINE__,__func__,error);
    }else{
        NSLog(@"batchUpdateRequest=%@",batchUpdateResult.result);//batchUpdateRequest=8 更新数据数量
    }
    
    //mergeChanges --> ?
//    NSArray<NSManagedObjectID *>*resultIDs = batchUpdateResult.result;
//    
//    NSDictionary *update = @{NSUpdatedObjectsKey:resultIDs};
//    [NSManagedObjectContext mergeChangesFromRemoteContextSave:update intoContexts:@[kAppContext]];
    
//    [kAppContext refreshObject:<#(nonnull NSManagedObject *)#> mergeChanges:<#(BOOL)#>];

    
    //更新数据
    [kAppContext refreshAllObjects];

//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Student"];
//    NSArray<Student *> *results = [kAppContext executeFetchRequest:fetchRequest error:&error];
//    [results enumerateObjectsUsingBlock:^(Student * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"age=%d",obj.age);
//    }];
//    
}

//批量删除
-(void)batchDelte{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age = %d",25];
    fetchRequest.predicate = predicate;
    NSBatchDeleteRequest *batchDeleteRequest = [[NSBatchDeleteRequest alloc]initWithFetchRequest:fetchRequest];
    batchDeleteRequest.resultType = NSBatchDeleteResultTypeCount;
    NSError *error = nil;
    NSBatchDeleteResult *batchDeleteResult = [kAppContext executeRequest:batchDeleteRequest error:&error];
    if (error) {
        NSLog(@"line:%d func:%s  error:%@",__LINE__,__func__,error);
    }else{
        NSLog(@"batchUpdateRequest=%@",batchDeleteResult.result);
    }
    
    [kAppContext refreshAllObjects];
    
//    NSFetchRequest *fetchRequest1 = [[NSFetchRequest alloc]initWithEntityName:@"Student"];
//    NSArray<Student *> *results = [kAppContext executeFetchRequest:fetchRequest1 error:&error];
//    [results enumerateObjectsUsingBlock:^(Student * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSLog(@"age=%d",obj.age);
//        }];
    
}
//异步查询
-(void)asyc{
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"School"];
    
    NSAsynchronousFetchRequest * asynchronousFetchRequest = [[NSAsynchronousFetchRequest alloc]initWithFetchRequest:fetchRequest completionBlock:^(NSAsynchronousFetchResult * _Nonnull result) {
        
        [result.finalResult enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            School *sch = (School *)obj;
            NSLog(@"-->%@ %@",sch.name,result.progress);
        }];
    }];
    NSError *error = nil;
    NSPersistentStoreResult *persistentStoreResult = [kAppContext executeRequest:asynchronousFetchRequest error:&error];
    if (error) {
        NSLog(@"line:%d func:%s  error:%@",__LINE__,__func__,error);
    }else{
        NSLog(@"persistentStoreResult=%@",persistentStoreResult);
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
    School *sch = [NSEntityDescription insertNewObjectForEntityForName:school inManagedObjectContext:kAppContext];

            sch.name = kSchool;
    [self fetchWithEntityName:school managedObjectContext:kAppContext];
    Grades *grd = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
grd.no = 8;
    if (kAppContext.hasChanges) {
        [kAppDelegete saveContext];
    }
            [self fetchWithEntityName:school managedObjectContext:kAppContext];
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
    
    if (kAppContext.hasChanges) {
       [kAppDelegete saveContext];
    }
    [self fetchWithEntityName:school managedObjectContext:kAppContext];
}
//给已存在的对象添加关联对象
-(void)relationships2{
//    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:school];
    NSError *error = nil;
//    NSArray<School *>*results = [kAppContext executeFetchRequest:fetchRequest error:&error];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Grades"];
    NSArray<Grades *>*results = [kAppContext executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"error=%@",error);
    }
    
    
//    for (School *sch in results) {
////        //给深圳外国语学校增加班级66 88
//        if ([sch.name isEqualToString:@"深圳外国语学校"]) {
//            Grades *gra66 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
//            gra66.no = 66;
//            
//            Grades *gra88 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
//            gra88.no = 88;
//            [sch addShcoolToGrad:[NSSet setWithObjects:gra88,gra66, nil]];
//        }
////        //给QingHuaMiddleSchool增加班级99 77
//        if ([sch.name isEqualToString:@"QingHuaMiddleSchool"]) {
//            Grades *gra99 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
//            gra99.no = 99;
//            
//            Grades *gra77 = [NSEntityDescription insertNewObjectForEntityForName:@"Grades" inManagedObjectContext:kAppContext];
//            gra77.no = 77;
//            
//            [sch addShcoolToGrad:[NSSet setWithObjects:gra99,gra77, nil]];
//        }
//    }
    

    //给88增加headmaster88 teacher 881 882 student 991 992
    for (Grades *gra in results) {
        
        if (gra.no == 88) {
            @try {
                Headmaster *h77 = [[Headmaster alloc]initWithEntity:[NSEntityDescription entityForName:@"Headmaster" inManagedObjectContext:kAppContext] insertIntoManagedObjectContext:kAppContext];
                h77.name = @"77";
                
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
//                NSLog(@"break");
                
            }
            
        }
    }

    [kAppDelegete saveContext];
    
    [self fetchWithEntityName:school managedObjectContext:kAppContext];
    }
#pragma mark- 删除
//测试deny  Items cannot be deleted from classToheadmaster.
-(void)deleteData1{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"ClassRoom"];//为什么把headmaster删掉了？
    NSError *error = nil;
    NSArray<ClassRoom *> *results = [kAppContext executeFetchRequest:fetchRequest error:&error];
    for (ClassRoom *c in results) {
        @try {
            [kAppContext deleteObject:c ];
        } @catch (NSException *exception) {
            NSLog(@"exception = %@ line:%d",exception,__LINE__);
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
            NSLog(@"exception = %@ line:%d",exception,__LINE__);
        } @finally {
            
        }
    }
    if (kAppContext.hasChanges) {
        [kAppDelegete saveContext];
    }
         [self fetchWithEntityName:school managedObjectContext:kAppContext];
}
-(void)deleteShool{
    School *sch = [[School alloc]initWithContext:kAppContext];
    [kAppContext deleteObject:sch];
    if (kAppContext.hasChanges) {
        [kAppDelegete saveContext];
    }
    [self fetchWithEntityName:school managedObjectContext:kAppContext];
}
@end
