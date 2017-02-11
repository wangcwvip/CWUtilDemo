//
//  CWUtils+Encoding.m
//  CWUtilsDemo
//
//  Created by wcw on 17/2/11.
//  Copyright © 2017年 wangcw. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "CWUtils+Encoding.h"

@implementation CWUtils (Encoding)

+ (NSString *)encodeMD5WithValue:(NSString *)value
{
    NSString *md5Str = @"";

    const char *cValue = [value UTF8String];
    if (cValue == NULL)
    {
        cValue = "";
    }
    
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cValue, (CC_LONG)strlen(cValue), r);
    for (NSUInteger index = 0; index < 16; ++index)
    {
        md5Str = [md5Str stringByAppendingFormat:@"%02x", r[index]];
    }
    
    return md5Str;
}

const static char UP_HEXCHAR[] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
const static char LO_HEXCHAR[] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
+ (NSString*)encodeHexWithData:(NSData *)data upperCase:(BOOL)upperCase
{
    NSUInteger len = [data length];
    Byte *pIn = (Byte*)malloc(len);
    memset(pIn, 0, sizeof(Byte));
    [data getBytes:pIn length:len];
    
    char *pOut = (char *)malloc(len*2+1);
    for (int i = 0; i < len; i++)
    {
        pOut[i*2+0] = upperCase? UP_HEXCHAR[((pIn[i] >> 4) & 0x0F)] : LO_HEXCHAR[((pIn[i] >> 4) & 0x0F)];
        pOut[i*2+1] = upperCase? UP_HEXCHAR[(pIn[i] & 0x0F)] : LO_HEXCHAR[(pIn[i] & 0x0F)];
    }
    pOut[len*2] = '\0';
    
    NSString *hexStr = [NSString stringWithCString:pOut encoding:NSASCIIStringEncoding];
    free(pOut);
    free(pIn);
    
    return hexStr;
}

+ (NSString *)encodeSHA512WithValue:(NSString *)value
{
    const char *cValue = [value cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cValue length:value.length];
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH*2];
    for(int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

@end
