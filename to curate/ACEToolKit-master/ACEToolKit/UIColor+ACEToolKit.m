// UIColor+ACEToolKit.m
//
// Copyright (c) 2013 Stefano Acerbetti
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "ACEToolKit.h"

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


CGFloat colorComponentFrom(NSString *string, NSUInteger start, NSUInteger length)
{
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

#pragma mark -

@implementation UIColor (ACEToolKit)

+ (UIColor *)colorWithHex:(int)hex
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
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

@end
