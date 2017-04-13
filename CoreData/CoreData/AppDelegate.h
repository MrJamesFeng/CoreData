//
//  AppDelegate.h
//  CoreData
//
//  Created by LDY on 17/4/12.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property(nonatomic,strong)NSManagedObjectModel *managedObjectModel;//数据模型

@property(nonatomic,strong)NSPersistentStoreCoordinator *persistentStoreCoordinator;//数据库调度器

@property(nonatomic,strong)NSManagedObjectContext *managedObjectContext;


- (void)saveContext;


@end

