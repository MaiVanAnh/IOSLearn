//
//  DrawView.swift
//  TouchTracker
//
//  Created by Van Anh on 5/15/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

class DrawView : UIView{
    var currentLine:Line?
    var finishedLines = [Line]()
    
    func stroke(_ line: Line){
        let path = UIBezierPath()
        path.lineWidth = 10
        path.lineCapStyle = .round
        
        path.move(to: line.begin)
        path.addLine(to: line.end)
        path.stroke()
        
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.black.setStroke()
        for line in finishedLines{
            stroke(line)
        }
        
        if let line = currentLine{
            UIColor.red.setStroke()
            stroke(line)
        }
    }
}
