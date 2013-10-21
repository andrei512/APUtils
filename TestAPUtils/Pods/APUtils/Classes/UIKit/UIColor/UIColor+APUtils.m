//
//  UIColor+APUtils.m
//
//  Created by Andrei Puni on 4/24/13.
//

#import "UIColor+APUtils.h"


CGFloat colorComponentFrom(NSString *string, NSUInteger start, NSUInteger length) {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

@implementation UIColor (APUtils)

+ (UIColor *)colorWithHex:(int)hex {
    int r = (hex >> 16) & 255;
    int g = (hex >> 8) & 255;
    int b = hex & 255;
    
    float rf = (float)r / 255.0f;
    float gf = (float)g / 255.0f;
    float bf = (float)b / 255.0f;
    
    return [UIColor colorWithRed:rf green:gf blue:bf alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    CGFloat alpha, red, blue, green;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = colorComponentFrom(colorString, 0, 1);
            green = colorComponentFrom(colorString, 1, 1);
            blue  = colorComponentFrom(colorString, 2, 1);
            break;
            
        case 4: // #ARGB
            alpha = colorComponentFrom(colorString, 0, 1);
            red   = colorComponentFrom(colorString, 1, 1);
            green = colorComponentFrom(colorString, 2, 1);
            blue  = colorComponentFrom(colorString, 3, 1);
            break;
            
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = colorComponentFrom(colorString, 0, 2);
            green = colorComponentFrom(colorString, 2, 2);
            blue  = colorComponentFrom(colorString, 4, 2);
            break;
            
        case 8: // #AARRGGBB
            alpha = colorComponentFrom(colorString, 0, 2);
            red   = colorComponentFrom(colorString, 2, 2);
            green = colorComponentFrom(colorString, 4, 2);
            blue  = colorComponentFrom(colorString, 6, 2);
            break;
            
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)APAliceBlue {
	return [UIColor colorWithHexString:@"#FFF0F8FF"];
}

+ (UIColor *)APAntiqueWhite {
	return [UIColor colorWithHexString:@"#FFFAEBD7"];
}

+ (UIColor *)APAqua {
	return [UIColor colorWithHexString:@"#FF00FFFF"];
}

+ (UIColor *)APAquamarine {
	return [UIColor colorWithHexString:@"#FF7FFFD4"];
}

+ (UIColor *)APAzure {
	return [UIColor colorWithHexString:@"#FFF0FFFF"];
}

+ (UIColor *)APBeige {
	return [UIColor colorWithHexString:@"#FFF5F5DC"];
}

+ (UIColor *)APBisque {
	return [UIColor colorWithHexString:@"#FFFFE4C4"];
}

+ (UIColor *)APBlack {
	return [UIColor colorWithHexString:@"#FF000000"];
}

+ (UIColor *)APBlanchedAlmond {
	return [UIColor colorWithHexString:@"#FFFFEBCD"];
}

+ (UIColor *)APBlue {
	return [UIColor colorWithHexString:@"#FF0000FF"];
}

+ (UIColor *)APBlueViolet {
	return [UIColor colorWithHexString:@"#FF8A2BE2"];
}

+ (UIColor *)APBrown {
	return [UIColor colorWithHexString:@"#FFA52A2A"];
}

+ (UIColor *)APBurlyWood {
	return [UIColor colorWithHexString:@"#FFDEB887"];
}

+ (UIColor *)APCadetBlue {
	return [UIColor colorWithHexString:@"#FF5F9EA0"];
}

+ (UIColor *)APChartreuse {
	return [UIColor colorWithHexString:@"#FF7FFF00"];
}

+ (UIColor *)APChocolate {
	return [UIColor colorWithHexString:@"#FFD2691E"];
}

+ (UIColor *)APCoral {
	return [UIColor colorWithHexString:@"#FFFF7F50"];
}

+ (UIColor *)APCornflowerBlue {
	return [UIColor colorWithHexString:@"#FF6495ED"];
}

+ (UIColor *)APCornsilk {
	return [UIColor colorWithHexString:@"#FFFFF8DC"];
}

+ (UIColor *)APCrimson {
	return [UIColor colorWithHexString:@"#FFDC143C"];
}

+ (UIColor *)APCyan {
	return [UIColor colorWithHexString:@"#FF00FFFF"];
}

+ (UIColor *)APDarkBlue {
	return [UIColor colorWithHexString:@"#FF00008B"];
}

+ (UIColor *)APDarkCyan {
	return [UIColor colorWithHexString:@"#FF008B8B"];
}

+ (UIColor *)APDarkGoldenrod {
	return [UIColor colorWithHexString:@"#FFB8860B"];
}

+ (UIColor *)APDarkGray {
	return [UIColor colorWithHexString:@"#FFA9A9A9"];
}

+ (UIColor *)APDarkGreen {
	return [UIColor colorWithHexString:@"#FF006400"];
}

+ (UIColor *)APDarkKhaki {
	return [UIColor colorWithHexString:@"#FFBDB76B"];
}

+ (UIColor *)APDarkMagenta {
	return [UIColor colorWithHexString:@"#FF8B008B"];
}

+ (UIColor *)APDarkOliveGreen {
	return [UIColor colorWithHexString:@"#FF556B2F"];
}

+ (UIColor *)APDarkOrange {
	return [UIColor colorWithHexString:@"#FFFF8C00"];
}

+ (UIColor *)APDarkOrchid {
	return [UIColor colorWithHexString:@"#FF9932CC"];
}

+ (UIColor *)APDarkRed {
	return [UIColor colorWithHexString:@"#FF8B0000"];
}

+ (UIColor *)APDarkSalmon {
	return [UIColor colorWithHexString:@"#FFE9967A"];
}

+ (UIColor *)APDarkSeaGreen {
	return [UIColor colorWithHexString:@"#FF8FBC8F"];
}

+ (UIColor *)APDarkSlateBlue {
	return [UIColor colorWithHexString:@"#FF483D8B"];
}

+ (UIColor *)APDarkSlateGray {
	return [UIColor colorWithHexString:@"#FF2F4F4F"];
}

+ (UIColor *)APDarkTurquoise {
	return [UIColor colorWithHexString:@"#FF00CED1"];
}

+ (UIColor *)APDarkViolet {
	return [UIColor colorWithHexString:@"#FF9400D3"];
}

+ (UIColor *)APDeepPink {
	return [UIColor colorWithHexString:@"#FFFF1493"];
}

+ (UIColor *)APDeepSkyBlue {
	return [UIColor colorWithHexString:@"#FF00BFFF"];
}

+ (UIColor *)APDimGray {
	return [UIColor colorWithHexString:@"#FF696969"];
}

+ (UIColor *)APDodgerBlue {
	return [UIColor colorWithHexString:@"#FF1E90FF"];
}

+ (UIColor *)APFirebrick {
	return [UIColor colorWithHexString:@"#FFB22222"];
}

+ (UIColor *)APFloralWhite {
	return [UIColor colorWithHexString:@"#FFFFFAF0"];
}

+ (UIColor *)APForestGreen {
	return [UIColor colorWithHexString:@"#FF228B22"];
}

+ (UIColor *)APFuchsia {
	return [UIColor colorWithHexString:@"#FFFF00FF"];
}

+ (UIColor *)APGainsboro {
	return [UIColor colorWithHexString:@"#FFDCDCDC"];
}

+ (UIColor *)APGhostWhite {
	return [UIColor colorWithHexString:@"#FFF8F8FF"];
}

+ (UIColor *)APGold {
	return [UIColor colorWithHexString:@"#FFFFD700"];
}

+ (UIColor *)APGoldenrod {
	return [UIColor colorWithHexString:@"#FFDAA520"];
}

+ (UIColor *)APGray {
	return [UIColor colorWithHexString:@"#FF808080"];
}

+ (UIColor *)APGreen {
	return [UIColor colorWithHexString:@"#FF008000"];
}

+ (UIColor *)APGreenYellow {
	return [UIColor colorWithHexString:@"#FFADFF2F"];
}

+ (UIColor *)APHoneydew {
	return [UIColor colorWithHexString:@"#FFF0FFF0"];
}

+ (UIColor *)APHotPink {
	return [UIColor colorWithHexString:@"#FFFF69B4"];
}

+ (UIColor *)APIndianRed {
	return [UIColor colorWithHexString:@"#FFCD5C5C"];
}

+ (UIColor *)APIndigo {
	return [UIColor colorWithHexString:@"#FF4B0082"];
}

+ (UIColor *)APIvory {
	return [UIColor colorWithHexString:@"#FFFFFFF0"];
}

+ (UIColor *)APKhaki {
	return [UIColor colorWithHexString:@"#FFF0E68C"];
}

+ (UIColor *)APLavender {
	return [UIColor colorWithHexString:@"#FFE6E6FA"];
}

+ (UIColor *)APLavenderBlush {
	return [UIColor colorWithHexString:@"#FFFFF0F5"];
}

+ (UIColor *)APLawnGreen {
	return [UIColor colorWithHexString:@"#FF7CFC00"];
}

+ (UIColor *)APLemonChiffon {
	return [UIColor colorWithHexString:@"#FFFFFACD"];
}

+ (UIColor *)APLightBlue {
	return [UIColor colorWithHexString:@"#FFADD8E6"];
}

+ (UIColor *)APLightCoral {
	return [UIColor colorWithHexString:@"#FFF08080"];
}

+ (UIColor *)APLightCyan {
	return [UIColor colorWithHexString:@"#FFE0FFFF"];
}

+ (UIColor *)APLightGoldenrodYellow {
	return [UIColor colorWithHexString:@"#FFFAFAD2"];
}

+ (UIColor *)APLightGray {
	return [UIColor colorWithHexString:@"#FFD3D3D3"];
}

+ (UIColor *)APLightGreen {
	return [UIColor colorWithHexString:@"#FF90EE90"];
}

+ (UIColor *)APLightPink {
	return [UIColor colorWithHexString:@"#FFFFB6C1"];
}

+ (UIColor *)APLightSalmon {
	return [UIColor colorWithHexString:@"#FFFFA07A"];
}

+ (UIColor *)APLightSeaGreen {
	return [UIColor colorWithHexString:@"#FF20B2AA"];
}

+ (UIColor *)APLightSkyBlue {
	return [UIColor colorWithHexString:@"#FF87CEFA"];
}

+ (UIColor *)APLightSlateGray {
	return [UIColor colorWithHexString:@"#FF778899"];
}

+ (UIColor *)APLightSteelBlue {
	return [UIColor colorWithHexString:@"#FFB0C4DE"];
}

+ (UIColor *)APLightYellow {
	return [UIColor colorWithHexString:@"#FFFFFFE0"];
}

+ (UIColor *)APLime {
	return [UIColor colorWithHexString:@"#FF00FF00"];
}

+ (UIColor *)APLimeGreen {
	return [UIColor colorWithHexString:@"#FF32CD32"];
}

+ (UIColor *)APLinen {
	return [UIColor colorWithHexString:@"#FFFAF0E6"];
}

+ (UIColor *)APMagenta {
	return [UIColor colorWithHexString:@"#FFFF00FF"];
}

+ (UIColor *)APMaroon {
	return [UIColor colorWithHexString:@"#FF800000"];
}

+ (UIColor *)APMediumAquamarine {
	return [UIColor colorWithHexString:@"#FF66CDAA"];
}

+ (UIColor *)APMediumBlue {
	return [UIColor colorWithHexString:@"#FF0000CD"];
}

+ (UIColor *)APMediumOrchid {
	return [UIColor colorWithHexString:@"#FFBA55D3"];
}

+ (UIColor *)APMediumPurple {
	return [UIColor colorWithHexString:@"#FF9370DB"];
}

+ (UIColor *)APMediumSeaGreen {
	return [UIColor colorWithHexString:@"#FF3CB371"];
}

+ (UIColor *)APMediumSlateBlue {
	return [UIColor colorWithHexString:@"#FF7B68EE"];
}

+ (UIColor *)APMediumSpringGreen {
	return [UIColor colorWithHexString:@"#FF00FA9A"];
}

+ (UIColor *)APMediumTurquoise {
	return [UIColor colorWithHexString:@"#FF48D1CC"];
}

+ (UIColor *)APMediumVioletRed {
	return [UIColor colorWithHexString:@"#FFC71585"];
}

+ (UIColor *)APMidnightBlue {
	return [UIColor colorWithHexString:@"#FF191970"];
}

+ (UIColor *)APMintCream {
	return [UIColor colorWithHexString:@"#FFF5FFFA"];
}

+ (UIColor *)APMistyRose {
	return [UIColor colorWithHexString:@"#FFFFE4E1"];
}

+ (UIColor *)APMoccasin {
	return [UIColor colorWithHexString:@"#FFFFE4B5"];
}

+ (UIColor *)APNavajoWhite {
	return [UIColor colorWithHexString:@"#FFFFDEAD"];
}

+ (UIColor *)APNavy {
	return [UIColor colorWithHexString:@"#FF000080"];
}

+ (UIColor *)APOldLace {
	return [UIColor colorWithHexString:@"#FFFDF5E6"];
}

+ (UIColor *)APOlive {
	return [UIColor colorWithHexString:@"#FF808000"];
}

+ (UIColor *)APOliveDrab {
	return [UIColor colorWithHexString:@"#FF6B8E23"];
}

+ (UIColor *)APOrange {
	return [UIColor colorWithHexString:@"#FFFFA500"];
}

+ (UIColor *)APOrangeRed {
	return [UIColor colorWithHexString:@"#FFFF4500"];
}

+ (UIColor *)APOrchid {
	return [UIColor colorWithHexString:@"#FFDA70D6"];
}

+ (UIColor *)APPaleGoldenrod {
	return [UIColor colorWithHexString:@"#FFEEE8AA"];
}

+ (UIColor *)APPaleGreen {
	return [UIColor colorWithHexString:@"#FF98FB98"];
}

+ (UIColor *)APPaleTurquoise {
	return [UIColor colorWithHexString:@"#FFAFEEEE"];
}

+ (UIColor *)APPaleVioletRed {
	return [UIColor colorWithHexString:@"#FFDB7093"];
}

+ (UIColor *)APPapayaWhip {
	return [UIColor colorWithHexString:@"#FFFFEFD5"];
}

+ (UIColor *)APPeachPuff {
	return [UIColor colorWithHexString:@"#FFFFDAB9"];
}

+ (UIColor *)APPeru {
	return [UIColor colorWithHexString:@"#FFCD853F"];
}

+ (UIColor *)APPink {
	return [UIColor colorWithHexString:@"#FFFFC0CB"];
}

+ (UIColor *)APPlum {
	return [UIColor colorWithHexString:@"#FFDDA0DD"];
}

+ (UIColor *)APPowderBlue {
	return [UIColor colorWithHexString:@"#FFB0E0E6"];
}

+ (UIColor *)APPurple {
	return [UIColor colorWithHexString:@"#FF800080"];
}

+ (UIColor *)APRed {
	return [UIColor colorWithHexString:@"#FFFF0000"];
}

+ (UIColor *)APRosyBrown {
	return [UIColor colorWithHexString:@"#FFBC8F8F"];
}

+ (UIColor *)APRoyalBlue {
	return [UIColor colorWithHexString:@"#FF4169E1"];
}

+ (UIColor *)APSaddleBrown {
	return [UIColor colorWithHexString:@"#FF8B4513"];
}

+ (UIColor *)APSalmon {
	return [UIColor colorWithHexString:@"#FFFA8072"];
}

+ (UIColor *)APSandyBrown {
	return [UIColor colorWithHexString:@"#FFF4A460"];
}

+ (UIColor *)APSeaGreen {
	return [UIColor colorWithHexString:@"#FF2E8B57"];
}

+ (UIColor *)APSeaShell {
	return [UIColor colorWithHexString:@"#FFFFF5EE"];
}

+ (UIColor *)APSienna {
	return [UIColor colorWithHexString:@"#FFA0522D"];
}

+ (UIColor *)APSilver {
	return [UIColor colorWithHexString:@"#FFC0C0C0"];
}

+ (UIColor *)APSkyBlue {
	return [UIColor colorWithHexString:@"#FF87CEEB"];
}

+ (UIColor *)APSlateBlue {
	return [UIColor colorWithHexString:@"#FF6A5ACD"];
}

+ (UIColor *)APSlateGray {
	return [UIColor colorWithHexString:@"#FF708090"];
}

+ (UIColor *)APSnow {
	return [UIColor colorWithHexString:@"#FFFFFAFA"];
}

+ (UIColor *)APSpringGreen {
	return [UIColor colorWithHexString:@"#FF00FF7F"];
}

+ (UIColor *)APSteelBlue {
	return [UIColor colorWithHexString:@"#FF4682B4"];
}

+ (UIColor *)APTan {
	return [UIColor colorWithHexString:@"#FFD2B48C"];
}

+ (UIColor *)APTeal {
	return [UIColor colorWithHexString:@"#FF008080"];
}

+ (UIColor *)APThistle {
	return [UIColor colorWithHexString:@"#FFD8BFD8"];
}

+ (UIColor *)APTomato {
	return [UIColor colorWithHexString:@"#FFFF6347"];
}

+ (UIColor *)APTransparent {
	return [UIColor colorWithHexString:@"#00FFFFFF"];
}

+ (UIColor *)APTurquoise {
	return [UIColor colorWithHexString:@"#FF40E0D0"];
}

+ (UIColor *)APViolet {
	return [UIColor colorWithHexString:@"#FFEE82EE"];
}

+ (UIColor *)APWheat {
	return [UIColor colorWithHexString:@"#FFF5DEB3"];
}

+ (UIColor *)APWhite {
	return [UIColor colorWithHexString:@"#FFFFFFFF"];
}

+ (UIColor *)APWhiteSmoke {
	return [UIColor colorWithHexString:@"#FFF5F5F5"];
}

+ (UIColor *)APYellow {
	return [UIColor colorWithHexString:@"#FFFFFF00"];
}

+ (UIColor *)APYellowGreen {
	return [UIColor colorWithHexString:@"#FF9ACD32"];
}

+ (NSArray *)allColors {
    static NSArray *colors = nil;
    if (colors == nil) {
        colors = @[
            [UIColor APAliceBlue],
            [UIColor APAntiqueWhite],
            [UIColor APAqua],
            [UIColor APAquamarine],
            [UIColor APAzure],
            [UIColor APBeige],
            [UIColor APBisque],
            [UIColor APBlack],
            [UIColor APBlanchedAlmond],
            [UIColor APBlue],
            [UIColor APBlueViolet],
            [UIColor APBrown],
            [UIColor APBurlyWood],
            [UIColor APCadetBlue],
            [UIColor APChartreuse],
            [UIColor APChocolate],
            [UIColor APCoral],
            [UIColor APCornflowerBlue],
            [UIColor APCornsilk],
            [UIColor APCrimson],
            [UIColor APCyan],
            [UIColor APDarkBlue],
            [UIColor APDarkCyan],
            [UIColor APDarkGoldenrod],
            [UIColor APDarkGray],
            [UIColor APDarkGreen],
            [UIColor APDarkKhaki],
            [UIColor APDarkMagenta],
            [UIColor APDarkOliveGreen],
            [UIColor APDarkOrange],
            [UIColor APDarkOrchid],
            [UIColor APDarkRed],
            [UIColor APDarkSalmon],
            [UIColor APDarkSeaGreen],
            [UIColor APDarkSlateBlue],
            [UIColor APDarkSlateGray],
            [UIColor APDarkTurquoise],
            [UIColor APDarkViolet],
            [UIColor APDeepPink],
            [UIColor APDeepSkyBlue],
            [UIColor APDimGray],
            [UIColor APDodgerBlue],
            [UIColor APFirebrick],
            [UIColor APFloralWhite],
            [UIColor APForestGreen],
            [UIColor APFuchsia],
            [UIColor APGainsboro],
            [UIColor APGhostWhite],
            [UIColor APGold],
            [UIColor APGoldenrod],
            [UIColor APGray],
            [UIColor APGreen],
            [UIColor APGreenYellow],
            [UIColor APHoneydew],
            [UIColor APHotPink],
            [UIColor APIndianRed],
            [UIColor APIndigo],
            [UIColor APIvory],
            [UIColor APKhaki],
            [UIColor APLavender],
            [UIColor APLavenderBlush],
            [UIColor APLawnGreen],
            [UIColor APLemonChiffon],
            [UIColor APLightBlue],
            [UIColor APLightCoral],
            [UIColor APLightCyan],
            [UIColor APLightGoldenrodYellow],
            [UIColor APLightGray],
            [UIColor APLightGreen],
            [UIColor APLightPink],
            [UIColor APLightSalmon],
            [UIColor APLightSeaGreen],
            [UIColor APLightSkyBlue],
            [UIColor APLightSlateGray],
            [UIColor APLightSteelBlue],
            [UIColor APLightYellow],
            [UIColor APLime],
            [UIColor APLimeGreen],
            [UIColor APLinen],
            [UIColor APMagenta],
            [UIColor APMaroon],
            [UIColor APMediumAquamarine],
            [UIColor APMediumBlue],
            [UIColor APMediumOrchid],
            [UIColor APMediumPurple],
            [UIColor APMediumSeaGreen],
            [UIColor APMediumSlateBlue],
            [UIColor APMediumSpringGreen],
            [UIColor APMediumTurquoise],
            [UIColor APMediumVioletRed],
            [UIColor APMidnightBlue],
            [UIColor APMintCream],
            [UIColor APMistyRose],
            [UIColor APMoccasin],
            [UIColor APNavajoWhite],
            [UIColor APNavy],
            [UIColor APOldLace],
            [UIColor APOlive],
            [UIColor APOliveDrab],
            [UIColor APOrange],
            [UIColor APOrangeRed],
            [UIColor APOrchid],
            [UIColor APPaleGoldenrod],
            [UIColor APPaleGreen],
            [UIColor APPaleTurquoise],
            [UIColor APPaleVioletRed],
            [UIColor APPapayaWhip],
            [UIColor APPeachPuff],
            [UIColor APPeru],
            [UIColor APPink],
            [UIColor APPlum],
            [UIColor APPowderBlue],
            [UIColor APPurple],
            [UIColor APRed],
            [UIColor APRosyBrown],
            [UIColor APRoyalBlue],
            [UIColor APSaddleBrown],
            [UIColor APSalmon],
            [UIColor APSandyBrown],
            [UIColor APSeaGreen],
            [UIColor APSeaShell],
            [UIColor APSienna],
            [UIColor APSilver],
            [UIColor APSkyBlue],
            [UIColor APSlateBlue],
            [UIColor APSlateGray],
            [UIColor APSnow],
            [UIColor APSpringGreen],
            [UIColor APSteelBlue],
            [UIColor APTan],
            [UIColor APTeal],
            [UIColor APThistle],
            [UIColor APTomato],
            [UIColor APTransparent],
            [UIColor APTurquoise],
            [UIColor APViolet],
            [UIColor APWheat],
            [UIColor APWhite],
            [UIColor APWhiteSmoke],
            [UIColor APYellow],
            [UIColor APYellowGreen]
        ];
    }
    return colors;
}

@end

NSString * const AliceBlue = @"#FFF0F8FF";
NSString * const AntiqueWhite = @"#FFFAEBD7";
NSString * const Aqua = @"#FF00FFFF";
NSString * const Aquamarine = @"#FF7FFFD4";
NSString * const Azure = @"#FFF0FFFF";
NSString * const Beige = @"#FFF5F5DC";
NSString * const Bisque = @"#FFFFE4C4";
NSString * const Black = @"#FF000000";
NSString * const BlanchedAlmond = @"#FFFFEBCD";
NSString * const Blue = @"#FF0000FF";
NSString * const BlueViolet = @"#FF8A2BE2";
NSString * const Brown = @"#FFA52A2A";
NSString * const BurlyWood = @"#FFDEB887";
NSString * const CadetBlue = @"#FF5F9EA0";
NSString * const Chartreuse = @"#FF7FFF00";
NSString * const Chocolate = @"#FFD2691E";
NSString * const Coral = @"#FFFF7F50";
NSString * const CornflowerBlue = @"#FF6495ED";
NSString * const Cornsilk = @"#FFFFF8DC";
NSString * const Crimson = @"#FFDC143C";
NSString * const Cyan = @"#FF00FFFF";
NSString * const DarkBlue = @"#FF00008B";
NSString * const DarkCyan = @"#FF008B8B";
NSString * const DarkGoldenrod = @"#FFB8860B";
NSString * const DarkGray = @"#FFA9A9A9";
NSString * const DarkGreen = @"#FF006400";
NSString * const DarkKhaki = @"#FFBDB76B";
NSString * const DarkMagenta = @"#FF8B008B";
NSString * const DarkOliveGreen = @"#FF556B2F";
NSString * const DarkOrange = @"#FFFF8C00";
NSString * const DarkOrchid = @"#FF9932CC";
NSString * const DarkRed = @"#FF8B0000";
NSString * const DarkSalmon = @"#FFE9967A";
NSString * const DarkSeaGreen = @"#FF8FBC8F";
NSString * const DarkSlateBlue = @"#FF483D8B";
NSString * const DarkSlateGray = @"#FF2F4F4F";
NSString * const DarkTurquoise = @"#FF00CED1";
NSString * const DarkViolet = @"#FF9400D3";
NSString * const DeepPink = @"#FFFF1493";
NSString * const DeepSkyBlue = @"#FF00BFFF";
NSString * const DimGray = @"#FF696969";
NSString * const DodgerBlue = @"#FF1E90FF";
NSString * const Firebrick = @"#FFB22222";
NSString * const FloralWhite = @"#FFFFFAF0";
NSString * const ForestGreen = @"#FF228B22";
NSString * const Fuchsia = @"#FFFF00FF";
NSString * const Gainsboro = @"#FFDCDCDC";
NSString * const GhostWhite = @"#FFF8F8FF";
NSString * const Gold = @"#FFFFD700";
NSString * const Goldenrod = @"#FFDAA520";
NSString * const Gray = @"#FF808080";
NSString * const Green = @"#FF008000";
NSString * const GreenYellow = @"#FFADFF2F";
NSString * const Honeydew = @"#FFF0FFF0";
NSString * const HotPink = @"#FFFF69B4";
NSString * const IndianRed = @"#FFCD5C5C";
NSString * const Indigo = @"#FF4B0082";
NSString * const Ivory = @"#FFFFFFF0";
NSString * const Khaki = @"#FFF0E68C";
NSString * const Lavender = @"#FFE6E6FA";
NSString * const LavenderBlush = @"#FFFFF0F5";
NSString * const LawnGreen = @"#FF7CFC00";
NSString * const LemonChiffon = @"#FFFFFACD";
NSString * const LightBlue = @"#FFADD8E6";
NSString * const LightCoral = @"#FFF08080";
NSString * const LightCyan = @"#FFE0FFFF";
NSString * const LightGoldenrodYellow = @"#FFFAFAD2";
NSString * const LightGray = @"#FFD3D3D3";
NSString * const LightGreen = @"#FF90EE90";
NSString * const LightPink = @"#FFFFB6C1";
NSString * const LightSalmon = @"#FFFFA07A";
NSString * const LightSeaGreen = @"#FF20B2AA";
NSString * const LightSkyBlue = @"#FF87CEFA";
NSString * const LightSlateGray = @"#FF778899";
NSString * const LightSteelBlue = @"#FFB0C4DE";
NSString * const LightYellow = @"#FFFFFFE0";
NSString * const Lime = @"#FF00FF00";
NSString * const LimeGreen = @"#FF32CD32";
NSString * const Linen = @"#FFFAF0E6";
NSString * const Magenta = @"#FFFF00FF";
NSString * const Maroon = @"#FF800000";
NSString * const MediumAquamarine = @"#FF66CDAA";
NSString * const MediumBlue = @"#FF0000CD";
NSString * const MediumOrchid = @"#FFBA55D3";
NSString * const MediumPurple = @"#FF9370DB";
NSString * const MediumSeaGreen = @"#FF3CB371";
NSString * const MediumSlateBlue = @"#FF7B68EE";
NSString * const MediumSpringGreen = @"#FF00FA9A";
NSString * const MediumTurquoise = @"#FF48D1CC";
NSString * const MediumVioletRed = @"#FFC71585";
NSString * const MidnightBlue = @"#FF191970";
NSString * const MintCream = @"#FFF5FFFA";
NSString * const MistyRose = @"#FFFFE4E1";
NSString * const Moccasin = @"#FFFFE4B5";
NSString * const NavajoWhite = @"#FFFFDEAD";
NSString * const Navy = @"#FF000080";
NSString * const OldLace = @"#FFFDF5E6";
NSString * const Olive = @"#FF808000";
NSString * const OliveDrab = @"#FF6B8E23";
NSString * const Orange = @"#FFFFA500";
NSString * const OrangeRed = @"#FFFF4500";
NSString * const Orchid = @"#FFDA70D6";
NSString * const PaleGoldenrod = @"#FFEEE8AA";
NSString * const PaleGreen = @"#FF98FB98";
NSString * const PaleTurquoise = @"#FFAFEEEE";
NSString * const PaleVioletRed = @"#FFDB7093";
NSString * const PapayaWhip = @"#FFFFEFD5";
NSString * const PeachPuff = @"#FFFFDAB9";
NSString * const Peru = @"#FFCD853F";
NSString * const Pink = @"#FFFFC0CB";
NSString * const Plum = @"#FFDDA0DD";
NSString * const PowderBlue = @"#FFB0E0E6";
NSString * const Purple = @"#FF800080";
NSString * const Red = @"#FFFF0000";
NSString * const RosyBrown = @"#FFBC8F8F";
NSString * const RoyalBlue = @"#FF4169E1";
NSString * const SaddleBrown = @"#FF8B4513";
NSString * const Salmon = @"#FFFA8072";
NSString * const SandyBrown = @"#FFF4A460";
NSString * const SeaGreen = @"#FF2E8B57";
NSString * const SeaShell = @"#FFFFF5EE";
NSString * const Sienna = @"#FFA0522D";
NSString * const Silver = @"#FFC0C0C0";
NSString * const SkyBlue = @"#FF87CEEB";
NSString * const SlateBlue = @"#FF6A5ACD";
NSString * const SlateGray = @"#FF708090";
NSString * const Snow = @"#FFFFFAFA";
NSString * const SpringGreen = @"#FF00FF7F";
NSString * const SteelBlue = @"#FF4682B4";
NSString * const Tan = @"#FFD2B48C";
NSString * const Teal = @"#FF008080";
NSString * const Thistle = @"#FFD8BFD8";
NSString * const Tomato = @"#FFFF6347";
NSString * const Transparent = @"#00FFFFFF";
NSString * const Turquoise = @"#FF40E0D0";
NSString * const Violet = @"#FFEE82EE";
NSString * const Wheat = @"#FFF5DEB3";
NSString * const White = @"#FFFFFFFF";
NSString * const WhiteSmoke = @"#FFF5F5F5";
NSString * const Yellow = @"#FFFFFF00";
NSString * const YellowGreen = @"#FF9ACD32";
