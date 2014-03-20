//
//  UITextField+APUtils.m
//
//  Created by Andrei Puni on 4/30/13.
//

#import "UITextField+APUtils.h"
#import <objc/runtime.h>
#define kStoreKey @"UITextField-text-store"

const char *kTextFieldStoreIdentifier = "kTextFieldStoreIdentifier";

static void *APUtilsUITextFieldContext = &APUtilsUITextFieldContext;

@interface UITextField (APUtils_Private)

@property (nonatomic, strong) NSString *storeIdentifier;

@end

@implementation UITextField (APUtils)

- (void)setStoreIdentifier:(NSString *)storeIdentifier {
    objc_setAssociatedObject(self, &kTextFieldStoreIdentifier, storeIdentifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)storeIdentifier {
    return objc_getAssociatedObject(self, &kTextFieldStoreIdentifier);
}

+ (void)clearStoredTexts {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@{} forKey:kStoreKey];
    [userDefaults synchronize];
}

+ (void)saveText:(NSString *)text forIdentifier:(NSString *)identifier {
    if (identifier != nil) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSDictionary *old = [userDefaults objectForKey:kStoreKey];
        NSMutableDictionary *new = [NSMutableDictionary dictionaryWithDictionary:old];
        new[identifier] = text ? text : @"";
        [userDefaults setObject:new forKey:kStoreKey];
        [userDefaults synchronize];
    }
}

- (void)persistAs:(NSString *)identifier {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *store = [userDefaults objectForKey:kStoreKey];
    
    self.text = store[identifier];
    
    self.storeIdentifier = identifier;
    // edit events
    [self addTarget:self
             action:@selector(textReallyDidChange:)
   forControlEvents:UIControlEventEditingChanged];
    
    // when programmaticaly changing text
    [self addObserver:self
           forKeyPath:NSStringFromSelector(@selector(text))
              options:NSKeyValueObservingOptionNew
              context:APUtilsUITextFieldContext];
}

- (void)stopPersisting {
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(text)) context:APUtilsUITextFieldContext];
}

- (void)textReallyDidChange:(UITextField *)editedTextField {
    [UITextField saveText:editedTextField.text
            forIdentifier:editedTextField.storeIdentifier];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context {
    if (context == APUtilsUITextFieldContext && [keyPath isEqualToString:NSStringFromSelector(@selector(text))]) {
        [UITextField saveText:[change objectForKey:NSKeyValueChangeNewKey]
                forIdentifier:((UITextField *)object).storeIdentifier];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
