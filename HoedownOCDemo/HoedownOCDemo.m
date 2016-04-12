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
    NSString *content = @"[Toc]\n# hello\n## world\n[TOC]\n\n- [ ]a\n- [x]b";
    /*
    NSString *content = @"# 流程图\n\
    <div class=\"mermaid\">\n\
    graph LR\n\
    A[Square Rect] -- Link text --> B((Circle))\n\
    A --> C(Round Rect)\n\
    B --> D{Rhombus}\n\
    C --> D\n\
    </div>\n\
";
     */
//    NSString *content = @"##流程图\n<p1>hello</p1>";
    HoedownWrapper *wrapper = [[HoedownWrapper alloc] initWithString:content];
    wrapper.renderOptions = HOEDOWN_HTML_HARD_WRAP | HOEDOWN_HTML_USE_TASK_LIST | HOEDOWN_HTML_BLOCKCODE_LINE_NUMBERS;
    wrapper.hoedownExtentions = HOEDOWN_EXT_MATH // 9
                                | HOEDOWN_EXT_MATH_EXPLICIT // 13
                                | HOEDOWN_EXT_FOOTNOTES // 2
                                | HOEDOWN_LI_BLOCK // 1
                                | HOEDOWN_EXT_FENCED_CODE // 1
                                | HOEDOWN_EXT_HIGHLIGHT // 6
                                | HOEDOWN_EXT_TABLES; // 0
    NSString *html = [wrapper HTML];
    NSLog(@"output: %@", html);
}

@end
