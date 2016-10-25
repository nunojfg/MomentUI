//
//  GPUImagePulgeFilter.m
//  moment
//
//  Created by Nuno Gonçalves on 24/08/16.
//  Copyright © 2016 Motionblink. All rights reserved.
//

#import "GPUImagePulgeFilter.h"

NSString *const kGPUImagePulgeFragmentShaderString = SHADER_STRING
(
 precision mediump float;
 
 uniform sampler2D inputImageTexture;
 varying vec2 textureCoordinate;
 
 void main() {
     // normalize to the center
     vec2 p = textureCoordinate - 0.5;
     
     // cartesian to polar coordinates
     float r = length(p);
     float a = atan(p.y, p.x);
     
     // distort
     //r = sqrt(r); // pinch
     r = r*r; // bulge
     
     // polar to cartesian coordinates
     p = r * vec2(cos(a), sin(a));
     
     // sample the webcam
     vec4 color = texture2D(inputImageTexture, p + 0.5);
     gl_FragColor = color;
 }
 );

@implementation GPUImagePulgeFilter

- (id)init;
{
    if (!(self = [self initWithFragmentShaderFromString:kGPUImagePulgeFragmentShaderString]))
    {
        return nil;
    }
    
    return self;
}

@end
