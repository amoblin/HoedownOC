//
//  HoedownWrapper.m
//  Marboo
//
//  Created by amoblin on 14/7/18.
//  Copyright (c) 2014年 amoblin. All rights reserved.
//

#import "HoedownWrapper.h"
#import "hoedown_html_patch.h"
#include "buffer.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static const int kNestingLevel = 15;
static const size_t kBufferUnit = 64;

@interface HoedownWrapper ()
@property (nonatomic, strong) NSData *markdownData;
@end


@implementation HoedownWrapper

- (instancetype)initWithData:(NSData *)data
{
    if ((self = [super init])) {
        _markdownData = data;
    }
    return self;
}


- (instancetype)initWithString:(NSString *)string
{
    return [self initWithData:[string dataUsingEncoding:NSUTF8StringEncoding]];
}

- (NSString *)HTML;
{
    NSString *html = [self bodyHTML];
    return [html stringByReplacingOccurrencesOfString:@"[TOC]" withString:[self tableOfContentsHTML] options:NSCaseInsensitiveSearch range:[html rangeOfString:@"[TOC]" options:NSCaseInsensitiveSearch]];
}

- (NSString *)bodyHTML;
{
    if ([self.markdownData length] == 0) {
        return nil;
    }
    hoedown_renderer *renderer = hoedown_html_renderer_new((hoedown_html_flags)self.hoedownExtentions, kNestingLevel);
    renderer->listitem = hoedown_patch_render_listitem;
//    renderer->blockcode = hoedown_patch_render_blockcode;
    NSString *output = render(renderer, self);
    hoedown_html_renderer_free(renderer);

    return output;
}

- (NSString *)tableOfContentsHTML;
{
    if ([self.markdownData length] == 0) {
        return nil;
    }

    hoedown_renderer *renderer = hoedown_html_toc_renderer_new(kNestingLevel);
    NSString *output = render(renderer, self);
    hoedown_html_renderer_free(renderer);

    return output;
}

/*
+ (NSString*)convertMarkdownFileAtPath:(NSString*)path {
    return [self convertMarkdownString:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil]];
}

+ (NSString*)convertMarkdownFileAtURL:(NSURL*)url {
    return [self convertMarkdownString:[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil]];
}

+ (NSString*)convertMarkdownString:(NSString *)markdownString {
    if(!markdownString.length) {
        fprintf(stderr,"Empty string passed into conversion method.");
        return nil;
    }

//    hoedown_buffer *ib, *ob;

    // sundown

    NSData *data = [markdownString dataUsingEncoding:NSUTF8StringEncoding];

	struct buf *ob;

	struct sd_callbacks callbacks;
	struct html_renderopt options;
	struct sd_markdown *markdown;

	// performing markdown parsing
	ob = bufnew(data.length);

	sdhtml_renderer(&callbacks, &options, 0);
	markdown = sd_markdown_new(0, 16, &callbacks, &options);
	sd_markdown_render(ob, data.bytes, data.length, markdown);
	sd_markdown_free(markdown);

    NSString *string = nil;
    if (!ob->size) {
        fprintf(stderr,"Conversion of input string resulted in no html");
	}
    else {
        // writing the result to string
        string = [[NSString alloc] initWithBytes:ob->data length:ob->size encoding:NSUTF8StringEncoding];
    }

	// cleanup
	bufrelease(ob);

	return string;
}
*/

#pragma mark Internal methods

static inline NSString* render(const hoedown_renderer *renderer, HoedownWrapper *self)
{
    hoedown_document *document = hoedown_document_new(renderer, self.hoedownExtentions, kNestingLevel);

    hoedown_buffer *outputBuffer = hoedown_buffer_new(kBufferUnit);
    hoedown_buffer *sourceBuffer = hoedown_buffer_new(kBufferUnit);

    if (self.isSmartyPantsEnabled) {
        hoedown_html_smartypants(sourceBuffer, [self.markdownData bytes], [self.markdownData length]);
    } else {
        hoedown_buffer_put(sourceBuffer, [self.markdownData bytes], [self.markdownData length]);
    }

    hoedown_document_render(document, outputBuffer, sourceBuffer->data, sourceBuffer->size);
    NSString *output = @(hoedown_buffer_cstr(outputBuffer));

    hoedown_document_free(document);
    hoedown_buffer_free(outputBuffer);

    return output;
}

@end
