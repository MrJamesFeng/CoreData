//
//  Student+CoreDataProperties.h
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *classes;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) ClassRoom *studentToClass;

@end

NS_ASSUME_NONNULL_END
