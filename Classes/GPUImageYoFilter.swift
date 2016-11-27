//
//  GPUImageYoFilter.swift
//  moment
//
//  Created by Nuno Gonçalves on 23/04/16.
//  Copyright © 2016 Motionblink. All rights reserved.
//

import UIKit
import GPUImage

class GPUImageYoFilter: GPUImageFilterGroup
{
    override init()
    {
        super.init()
        
        let saturFilter = GPUImageSaturationFilter()
        saturFilter.saturation = 0.5
        
        let monoFilter = GPUImageMonochromeFilter()
        monoFilter.color = GPUVector4(one: 0, two: 3, three: 2, four: 1)
        monoFilter.intensity = 0.1
        
        let vigFilter = GPUImageVignetteFilter()
        vigFilter.vignetteEnd = 0.8
        
        let expoFilter = GPUImageExposureFilter()
        expoFilter.exposure = 0.3
        
        saturFilter.addTarget(monoFilter)
        monoFilter.addTarget(vigFilter)
        vigFilter.addTarget(expoFilter)
        
        self.initialFilters = [saturFilter]
        self.terminalFilter = expoFilter
    }
}
