//
//  ClassRoom+CoreDataProperties.h
//  CoreData
//
//  Created by LDY on 17/4/13.
//  Copyright © 2017年 LDY. All rights reserved.
//

#import "ClassRoom+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface ClassRoom (CoreDataProperties)

+ (NSFetchRequest<ClassRoom *> *)fetchRequest;

@property (nonatomic) int16_t no;
@property (nullable, nonatomic, retain) Headmaster *classToheadmaster;
@property (nullable, nonatomic, retain) NSSet<Student *> *classToStudent;
@property (nullable, nonatomic, retain) NSSet<Teacher *> *classToTeacher;

@end

@interface ClassRoom (CoreDataGeneratedAccessors)

- (void)addClassToStudentObject:(Student *)value;
- (void)removeClassToStudentObject:(Student *)value;
- (void)addClassToStudent:(NSSet<Student *> *)values;
- (void)removeClassToStudent:(NSSet<Student *> *)values;

- (void)addClassToTeacherObject:(Teacher *)value;
- (void)removeClassToTeacherObject:(Teacher *)value;
- (void)addClassToTeacher:(NSSet<Teacher *> *)values;
- (void)removeClassToTeacher:(NSSet<Teacher *> *)values;

@end

NS_ASSUME_NONNULL_END
