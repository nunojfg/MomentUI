//
//  IFPrometheanFilter.m
//  moment
//
//  Created by Nuno Gonçalves on 20/04/16.
//  Copyright © 2016 Motionblink. All rights reserved.
//

#import "IFPrometheanFilter.h"

NSString *const kPShaderString = SHADER_STRING
(
 varying highp vec2 textureCoordinate;
 
 uniform sampler2D inputImageTexture;
 uniform lowp float saturation;
 
 const mediump vec3 luminanceWeighting = vec3(0.725, 0.8154, 0.8721);
 
 void main()
{
    lowp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);
    lowp float luminance = dot(textureColor.rgb, luminanceWeighting);
    lowp vec3 greyScaleColor = vec3(luminance);
    
    gl_FragColor = vec4(mix(greyScaleColor, textureColor.rgb, saturation), textureColor.w);
    
}
 );

@implementation IFPrometheanFilter


- (id)init
{
    self = [super initWithFragmentShaderFromString:kPShaderString  sources:@[
                                                                             [IFImageFilter filterImageNamed:@"1977blowout"]
                                                                             ]];
    return self;
}

@end
