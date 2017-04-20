//
//  UserInfo+CoreDataProperties.h
//  CoreData
//
//  Created by LDY on 17/4/20.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "UserInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserInfo (CoreDataProperties)

+ (NSFetchRequest<UserInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *attrAdded;
@property (nullable, nonatomic, copy) NSDate *birthday;
@property (nullable, nonatomic, retain) NSObject *icon;
@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
