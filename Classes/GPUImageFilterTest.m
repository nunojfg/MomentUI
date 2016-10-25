//
//  GPUImageFilterTest.m
//  moment
//
//  Created by Nuno Gonçalves on 21/08/16.
//  Copyright © 2016 Motionblink. All rights reserved.
//

#import "GPUImageFilterTest.h"

/*NSString *const kGPUImageTestFragmentShaderString = SHADER_STRING
(
 precision mediump float;
 uniform sampler2D inputImageTexture;
 varying vec2 textureCoordinate;
 const float PI = 3.1415926535;
 uniform float BarrelPower;
 
 vec2 Distort(vec2 p)
 {
     float theta  = atan(p.y, p.x);
     float radius = length(p);
     radius = pow(radius, BarrelPower);
     p.x = radius * cos(theta);
     p.y = radius * sin(theta);
     return 0.5 * (p + 1.0);
 }
 
 void main()
 {
     vec2 uv;
     float d = length(2.0 * textureCoordinate.xy - 1.0);
     if (d < 1.0)
     {
         uv = Distort(2.0 * textureCoordinate.xy - 1.0);
     }
     else
     {
         uv = textureCoordinate.xy;
     }
     vec4 c = texture2D(inputImageTexture, uv);
     gl_FragColor = c;
 }
 );*/


NSString *const kGPUImageTestVertexShaderString = SHADER_STRING
(
 precision mediump float;
 varying vec4 Vertex_UV;
 varying vec2 textureCoordinate;
 attribute vec4 gxl3d_ModelViewProjectionMatrix;
 void main()
{
    //gl_Position = gxl3d_ModelViewProjectionMatrix;
    //Vertex_UV = textureCoordinate;
});

NSString *const kGPUImageTestFragmentShaderString = SHADER_STRING
(
 precision mediump float;
 uniform sampler2D inputImageTexture;
 varying vec2 textureCoordinate;
 varying vec4 Vertex_UV;
 const float PI = 3.1415926535;
 
 void main()
{
    float aperture = 178.0;
    float apertureHalf = 0.5 * aperture * (PI / 180.0);
    float maxFactor = sin(apertureHalf);
    
    vec2 uv;
    vec2 xy = 2.0 * textureCoordinate.xy - 1.0;
    float d = length(xy);
    if (d < (2.0-maxFactor))
    {
        d = length(xy * maxFactor);
        float z = sqrt(1.0 - d * d);
        float r = atan(d, z) / PI;
        float phi = atan(xy.y, xy.x);
        
        uv.x = r * cos(phi) + 0.5;
        uv.y = r * sin(phi) + 0.5;
    }
    else
    {
        uv = textureCoordinate.xy;
    }
    vec4 c = texture2D(inputImageTexture, uv);
    gl_FragColor = c;
}
);

@implementation GPUImageFilterTest

- (id)init;
{
    //http://pixelshaders.com/editor/
    //http://www.geeks3d.com/20140213/glsl-shader-library-fish-eye-and-dome-and-barrel-distortion-post-processing-filters/
   /* if (!(self = [super initWithFragmentShaderFromString:kGPUImageTestFragmentShaderString sources:@[ [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:@"lagoapatas.jpg"]]]]))
    {
        return nil;
    }*/
    
    if (!(self = [self initWithFragmentShaderFromString:kGPUImageTestFragmentShaderString]))
    {
        return nil;
    }
    
    return self;
}


@end
