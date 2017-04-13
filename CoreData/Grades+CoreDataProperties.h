//
//  Grades+CoreDataProperties.h
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "Grades+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Grades (CoreDataProperties)

+ (NSFetchRequest<Grades *> *)fetchRequest;

@property (nonatomic) int16_t no;
@property (nullable, nonatomic, retain) NSSet<Headmaster *> *gradeToheadmaster;
@property (nullable, nonatomic, retain) School *gradeToSchool;

@end

@interface Grades (CoreDataGeneratedAccessors)

- (void)addGradeToheadmasterObject:(Headmaster *)value;
- (void)removeGradeToheadmasterObject:(Headmaster *)value;
- (void)addGradeToheadmaster:(NSSet<Headmaster *> *)values;
- (void)removeGradeToheadmaster:(NSSet<Headmaster *> *)values;

@end

NS_ASSUME_NONNULL_END
