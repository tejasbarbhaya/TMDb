//
//  NSString+AESCrypt.h


#import <Foundation/Foundation.h>
#import "NSData+AESCrypt.h"

@interface NSString (AESCrypt)

- (NSString *)AES256EncryptWithKey:(NSString *)key; //returns AES256 encrypted string
- (NSString *)AES256DecryptWithKey:(NSString *)key; //returns decrypted string

@end
