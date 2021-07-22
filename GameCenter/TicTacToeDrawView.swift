//
//  TicTacToeDrawView.swift
//  GameCenter
//
//  Created by 謝孟芩 on 2021/7/23.
//

import UIKit

class TicTacToeDrawView: UIView {

 
    override func draw(_ rect: CGRect)
    {
        // Drawing code
        let path = UIBezierPath()
        let squareWidth: CGFloat = 100
        let lineWidth: CGFloat = 20
        
        var y = squareWidth + lineWidth 
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: rect.width, y: y))
        
        y += squareWidth + lineWidth
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: rect.width, y: y))
        
        var x = squareWidth + lineWidth / 2
        path.move(to: CGPoint(x: x, y: 0))
        path.addLine(to: CGPoint(x: x, y: rect.height))
        
        x += squareWidth + lineWidth
        path.move(to: CGPoint(x: x, y: 0))
        path.addLine(to: CGPoint(x: x, y: rect.height))
        
        path.lineWidth = lineWidth
        UIColor.purple.setStroke()
        path.stroke()
    }
  

}
