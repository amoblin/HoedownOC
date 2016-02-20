//
//  HoedownWrapper.h
//  Marboo
//
//  Created by amoblin on 14/7/18.
//  Copyright (c) 2014年 amoblin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "html.h"
#import "document.h"
#import "hoedown_html_patch.h"

typedef NS_ENUM(NSUInteger, JKSMarkdownExtention) {
	JKSMarkdownExtentionNoIntraEmphasis = HOEDOWN_EXT_NO_INTRA_EMPHASIS,
	JKSMarkdownExtentionTables = HOEDOWN_EXT_TABLES,
	JKSMarkdownExtentionFencedCode = HOEDOWN_EXT_FENCED_CODE,
	JKSMarkdownExtentionAutolink = HOEDOWN_EXT_AUTOLINK,
	JKSMarkdownExtentionStrikethrough = HOEDOWN_EXT_STRIKETHROUGH,
	JKSMarkdownExtentionUnderline = HOEDOWN_EXT_UNDERLINE,
	JKSMarkdownExtentionSpaceHeaders = HOEDOWN_EXT_SPACE_HEADERS,
	JKSMarkdownExtentionSuperscript = HOEDOWN_EXT_SUPERSCRIPT,
	JKSMarkdownExtentionDisableIndentedCode = HOEDOWN_EXT_DISABLE_INDENTED_CODE,
	JKSMarkdownExtentionHighlight = HOEDOWN_EXT_HIGHLIGHT,
	JKSMarkdownExtentionFootnotes = HOEDOWN_EXT_FOOTNOTES,
	JKSMarkdownExtentionQuote = HOEDOWN_EXT_QUOTE,
};

typedef NS_ENUM(NSUInteger, JKSMarkdownRenderOption) {
    JKSMarkdownRenderOptionSkipHTML = HOEDOWN_HTML_SKIP_HTML,
//    JKSMarkdownRenderOptionSkipStyle = HOEDOWN_HTML_SKIP_STYLE,
//    JKSMarkdownRenderOptionSkipImages = HOEDOWN_HTML_SKIP_IMAGES,
//    JKSMarkdownRenderOptionSkipLinks = HOEDOWN_HTML_SKIP_LINKS,
//    JKSMarkdownRenderOptionExpandTabs = HOEDOWN_HTML_EXPAND_TABS,
//    JKSMarkdownRenderOptionTableOfContents = HOEDOWN_HTML_TOC,
    JKSMarkdownRenderOptionEscape = HOEDOWN_HTML_ESCAPE,
    JKSMarkdownRenderOptionHardWrap = HOEDOWN_HTML_HARD_WRAP,
    JKSMarkdownRenderOptionUseXHTML = HOEDOWN_HTML_USE_XHTML,
//    JKSMarkdownRenderOptionPrettify = HOEDOWN_HTML_PRETTIFY,
};

@interface HoedownWrapper : NSObject

/* converts the markdown in the file to an html string*/
//+ (NSString*)convertMarkdownFileAtPath:(NSString*)path;

/* converts the markdown at the url to an html string*/
//+ (NSString*)convertMarkdownFileAtURL:(NSURL*)url;

/* converts the given markdown string to an html string*/
//+ (NSString*)convertMarkdownString:(NSString*)markdown;

/// Whether or not to preprocess with "smarty pants". Defaults to NO
@property (nonatomic, assign, getter = isSmartyPantsEnabled) BOOL smartyPantsEnabled;
/// Mask of Markdown extentions to enable
@property (nonatomic, assign) hoedown_extensions hoedownExtentions;
/// Mask of HMTL render options to use
@property (nonatomic, assign) JKSMarkdownRenderOption renderOptions;

- (instancetype)initWithString:(NSString *)string;
- (NSString *)HTML;
@end
