//
//  Teacher+CoreDataProperties.h
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "Teacher+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Teacher (CoreDataProperties)

+ (NSFetchRequest<Teacher *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *course;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) ClassRoom *teacherToClass;

@end

NS_ASSUME_NONNULL_END
