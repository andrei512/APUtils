//
//  APRuntimeExamples.m
//  DevAPUtils
//
//  Created by Andrei on 10/20/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "APRuntimeExamples.h"
#import "NSObject+APRuntime.h"

// from https://developer.apple.com/library/mac/documentation/cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101

enum FooManChu { FOO, MAN, CHU };
struct YorkshireTeaStruct { int pot; char lady; };
typedef struct YorkshireTeaStruct YorkshireTeaStructType;
union MoneyUnion { float alone; double down; };

@interface APRuntimeExampleClass : NSObject

@property char charDefault;
@property double doubleDefault;
@property enum FooManChu enumDefault;
@property float floatDefault;
@property int intDefault;
@property long longDefault;
@property short shortDefault;
@property signed signedDefault;
@property struct YorkshireTeaStruct structDefault;
@property YorkshireTeaStructType typedefDefault;
@property union MoneyUnion unionDefault;
@property unsigned unsignedDefault;
@property int (*functionPointerDefault)(char *);

//Note: the compiler warns: no 'assign', 'retain', or 'copy' attribute is specified - 'assign' is assumed"
@property id idDefault;

@property int *intPointer;
@property void *voidPointerDefault;
@property int intSynthEquals;
@property(getter=intGetFoo, setter=intSetFoo:) int intSetterGetter;
@property(readonly) int intReadonly;
@property(getter=isIntReadOnlyGetter, readonly) int intReadonlyGetter;
@property(readwrite) int intReadwrite;
@property(assign) int intAssign;
@property(retain) id idRetain;
@property(copy) id idCopy;
@property(nonatomic) int intNonatomic;
@property(nonatomic, readonly, copy) id idReadonlyCopyNonatomic;
@property(nonatomic, readonly, retain) id idReadonlyRetainNonatomic;

@property (nonatomic, strong) NSObject *dynamicTest;

@end

@implementation APRuntimeExampleClass

@dynamic dynamicTest;
@synthesize intSynthEquals=_intSynthEquals;

@end

@implementation APRuntimeExamples

+ (void)showExamples {
    [self getPropertyInfo];
}

+ (void)getPropertyInfo {
    NSLog(@"APRuntimeExampleClass.propertyInfo = %@", [APRuntimeExampleClass propertyInfo]);
}

@end
