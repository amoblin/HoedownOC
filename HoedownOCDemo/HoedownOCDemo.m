//
//  HoedownOCDemo.m
//  HoedownOCDemo
//
//  Created by amoblin on 16/2/20.
//  Copyright © 2016年 marboo. All rights reserved.
//

#import "HoedownOCDemo.h"
#import "HoedownWrapper.h"

@implementation HoedownOCDemo

- (void)test;
{
    HoedownWrapper *wrapper = [[HoedownWrapper alloc] initWithString:@"[Toc]\n# hello\n## world\n[TOC]"];
    wrapper.hoedownExtentions = HOEDOWN_EXT_MATH
                                | HOEDOWN_EXT_MATH_EXPLICIT
                                | HOEDOWN_EXT_FOOTNOTES
                                | HOEDOWN_LI_BLOCK
                                | HOEDOWN_HTML_USE_TASK_LIST
                                | HOEDOWN_EXT_FENCED_CODE
                                | HOEDOWN_HTML_BLOCKCODE_LINE_NUMBERS
                                |HOEDOWN_EXT_HIGHLIGHT
                                | HOEDOWN_EXT_TABLES;
    NSString *html = [wrapper HTML];
    NSLog(@"output: %@", html);
}

@end
