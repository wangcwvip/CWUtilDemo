//
//  CWUtils+Encryption.m
//  CWUtilsDemo
//
//  Created by wcw on 17/2/11.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import <CommonCrypto/CommonCryptor.h>
#import "CWUtils+Encryption.h"

#define AES256_PRIVATE_KEY  @"00000000000000000000000000000000"

@implementation CWUtils (Encryption)

#pragma mark AES256

+ (NSData *)AES256EncryptData:(NSData *)data
{
    return [self AES256EncryptData:data withKey:AES256_PRIVATE_KEY];
}

+ (NSData *)AES256DecryptData:(NSData *)data
{
    return [self AES256DecryptData:data withKey:AES256_PRIVATE_KEY];
}

+ (NSData *)AES256EncryptData:(NSData *)data withKey:(NSString *)key
{
    char szKey[kCCKeySizeAES256+1];
    bzero(szKey, sizeof(szKey));
    [key getCString:szKey maxLength:sizeof(szKey) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          szKey, kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess)
    {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    else
    {
        free(buffer);
        return nil;
    }
}


+ (NSData *)AES256DecryptData:(NSData *)data withKey:(NSString *)key
{
    char szKey[kCCKeySizeAES256+1];
    bzero(szKey, sizeof(szKey));
    [key getCString:szKey maxLength:sizeof(szKey) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          szKey, kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess)
    {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    else
    {
        free(buffer);
        return nil;
    }
}

@end
