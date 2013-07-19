APUtils [![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=andrei512&url=https://github.com/andrei512/APUtils&title=APUtils&language=&tags=github&category=software) 
=======

A collection of helpful categories for base obj-c classes and snippets I collected in three years of iOS development.

## APUtils.h

```objective-c

+ (BOOL)canMakePhoneCalls;

// one liner that dismisses the keyboard
+ (void)findAndResignFirstReponder;

// measures the time a block takes to execute
+ (void)benchmark:(void(^)(void))block name:(NSString *)name;
+ (void)benchmark:(void(^)(void))block;


```

## NSArray

```objective-c

- (NSMutableArray *)filter:(BoolBlock)block;

- (NSMutableArray *)map:(ObjectBlock)block;

- (NSMutableArray *)mapWithSelector:(SEL)selector;

// uses NSObject+APUtils to create objects from a JSON array
- (NSMutableArray *)mapToClass:(Class)objectClass;

// load an array from a plist located in the main bundle
+ (NSArray *)arrayFromPlistNamed:(NSString *)name;

```


## NSDictionary

```objective-c

// combines two dictionaries 
- (NSMutableDictionary *)merge:(NSDictionary *)dict;

```

## NSNumber

```objective-c

- (NSString *)formatedString;

- (NSString *)formatedStringWithCurrency:(NSString *)currency;

```


## NSObject

```objective-c

// Exameple for - (id)loadFrom:(id)data
//
// @interface User
//
// @property (nonatomic, retain) NSString *firstName;
// @property (nonatomic, retain) NSString *lastName;
//
// @property (nonatomic, retain) NSNumber *age;
//
// @end
//
// ...
//
// NSDictionary *info = @{
//                        @"firstName" : @"Andrei",
//                        @"last_name" : @"Puni",
//                        @"age" : @22,
// };
//
// User *user = [[User new] loadFrom:info];
//
// now user.firstName is @"Andrei", user.lastName is @"Puni" and user.age is @21

- (id)loadFrom:(id)data;

 

// [user ashes] wil return 
//
// @{
//                        @"firstName" : @"Andrei",
//                        @"lastName" : @"Puni",
//                        @"age" : @22,
// }

- (id)ashes;

// [user ashes:YES] wil return 
//
// @{
//                        @"first_name" : @"Andrei",
//                        @"last_name" : @"Puni",
//                        @"age" : @22,
// }

- (id)ashes:(BOOL)underscored;

// user could have been created like so
// User *user = [User createFrom:info];

+ (id)createFrom:(id)data;

- (NSString *)className;


```

## NSString

```objective-c


// [@"FooBar stringByRemovingSuffix:@"Bar"] -> @"Foo"
- (NSString *)stringByRemovingSuffix:(NSString *)suffix;

- (BOOL)containsString:(NSString *)substring;
- (BOOL)containsString:(NSString *)substring caseSensitive:(BOOL)sensitive;

// test is matches a regexp 
// ! there a some predefined patters for
// kNumberRegex - floats
// kIntegerRegex - integers
// kEmailRegex - emails

- (BOOL)matches:(NSString *)pattern;

```


## NSUserDefaults

```objective-c

// sets a value in NSUserDefaults syncronizes
+ (BOOL)setUserValue:(id)value forKey:(id)key;
 
// convenience method for geting the value for a key from NSUserDefaults
+ (id)valueForKey:(NSString *)key;

```


## UITextField

```objective-c

- (void)persistAs:(NSString *)identifier;

+ (void)clearStoredTexts;
+ (void)saveText:(NSString *)text forIdentifier:(NSString *)identifier;


```


