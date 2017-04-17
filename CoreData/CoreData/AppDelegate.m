//
//  AppDelegate.m
//  CoreData
//
//  Created by LDY on 17/4/12.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor groupTableViewBackgroundColor];
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc];
    [self.window setRootViewController:navc];
    [self.window makeKeyAndVisible];
   
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CoreData2"];//版本迁移
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

/*
 Unresolved error Error Domain=NSCocoaErrorDomain Code=134110 "An error occurred during persistent store migration." UserInfo={sourceURL=file:///var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application%20Support/CoreData.sqlite, reason=Cannot migrate store in-place: I/O error for database at /var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application Support/.CoreData.sqlite.migrationdestination_41b5a6b5c6e848c462a8480cd24caef3.  SQLite error code:1, 'table ZGRADES already exists', destinationURL=file:///var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application%20Support/.CoreData.sqlite.migrationdestination_41b5a6b5c6e848c462a8480cd24caef3, NSUnderlyingError=0x170054be0 {Error Domain=NSCocoaErrorDomain Code=134110 "An error occurred during persistent store migration." UserInfo={NSSQLiteErrorDomain=1, NSFilePath=/var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application Support/.CoreData.sqlite.migrationdestination_41b5a6b5c6e848c462a8480cd24caef3, NSUnderlyingException=I/O error for database at /var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application Support/.CoreData.sqlite.migrationdestination_41b5a6b5c6e848c462a8480cd24caef3.  SQLite error code:1, 'table ZGRADES already exists', reason=I/O error for database at /var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application Support/.CoreData.sqlite.migrationdestination_41b5a6b5c6e848c462a8480cd24caef3.  SQLite error code:1, 'table ZGRADES already exists'}}}, {
 NSUnderlyingError = "Error Domain=NSCocoaErrorDomain Code=134110 \"An error occurred during persistent store migration.\" UserInfo={NSSQLiteErrorDomain=1, NSFilePath=/var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application Support/.CoreData.sqlite.migrationdestination_41b5a6b5c6e848c462a8480cd24caef3, NSUnderlyingException=I/O error for database at /var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application Support/.CoreData.sqlite.migrationdestination_41b5a6b5c6e848c462a8480cd24caef3.  SQLite error code:1, 'table ZGRADES already exists', reason=I/O error for database at /var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application Support/.CoreData.sqlite.migrationdestination_41b5a6b5c6e848c462a8480cd24caef3.  SQLite error code:1, 'table ZGRADES already exists'}";
 destinationURL = "file:///var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application%20Support/.CoreData.sqlite.migrationdestination_41b5a6b5c6e848c462a8480cd24caef3";
 reason = "Cannot migrate store in-place: I/O error for database at /var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application Support/.CoreData.sqlite.migrationdestination_41b5a6b5c6e848c462a8480cd24caef3.  SQLite error code:1, 'table ZGRADES already exists'";
 sourceURL = "file:///var/mobile/Containers/Data/Application/80CD8C6B-21CA-4A44-A506-82DD2B76A548/Library/Application%20Support/CoreData.sqlite";
 }
 */

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    NSLog(@"%@",kmanagedObjectContext);
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

/*以下通过以下方式创建的context不能调用saveContext*/

-(NSManagedObjectModel *)managedObjectModel{
    if (!_managedObjectModel) {
        //数据模型路径
        NSURL *momUrl = [[NSBundle mainBundle]URLForResource:@"CoreData" withExtension:@"momd"];//Extension:@"momd" 不是xcdatamodeld
        _managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:momUrl];
    }
    return _managedObjectModel;
}

-(NSPersistentStoreCoordinator *)persistentStoreCoordinator{
    if (!_persistentStoreCoordinator) {
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.managedObjectModel];
//        配置数据库路径
        NSURL *domainUrl = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].lastObject;
        NSURL *sqliteUrl =[domainUrl URLByAppendingPathComponent:@"CoreData.sqlite"];
//        添加数据库
        NSError *error = nil;
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteUrl options:nil error:&error];
        if (error) {
            NSLog(@"addPersistentStore error = %@",error);
        }
        
        /*
         //添加自定义仓库                                                                                                                                                        
        NSURL *storeUrl = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Launch"];
//        NSSQLiteStoreType API_AVAILABLE(macosx(10.4),ios(3.0));
//        COREDATA_EXTERN NSString * const NSXMLStoreType API_AVAILABLE(macosx(10.4)) API_UNAVAILABLE(ios);
//        COREDATA_EXTERN NSString * const NSBinaryStoreType API_AVAILABLE(macosx(10.4),ios(3.0));
//        COREDATA_EXTERN NSString * const NSInMemoryStoreType
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:@"Launch" URL:storeUrl options:nil error:&error];
        */
    }
    return _persistentStoreCoordinator;
}
-(NSURL *)applicationDocumentsDirectory{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}

#warning NSPrivateQueueConcurrencyType
-(NSManagedObjectContext *)managedObjectContext{
    
    if (!_managedObjectContext) {
        _managedObjectContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        //指定调度器
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return _managedObjectContext;
}


@end
