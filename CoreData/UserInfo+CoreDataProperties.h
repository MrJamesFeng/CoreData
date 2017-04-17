//
//  UserInfo+CoreDataProperties.h
//  CoreData
//
//  Created by LDY on 17/4/17.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "UserInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserInfo (CoreDataProperties)

+ (NSFetchRequest<UserInfo *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSObject *icon;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSDate *birthday;

@property(nonatomic,copy)NSString *attrAdded;//新增属性


@end

NS_ASSUME_NONNULL_END
