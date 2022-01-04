
import UIKit
import SwiftUI

extension UIBezierPath {
    
    static func calculateBounds(paths: [UIBezierPath]) -> CGRect {
        let myPaths = UIBezierPath()
        for path in paths {
            myPaths.append(path)
        }
        return (myPaths.bounds)
    }

    // "M"字母SVG图形的贝塞尔路径
    static var SVG_M_Letter: UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 193.3, y: 1.9))
        bezierPath.addCurve(to: CGPoint(x: 143.5, y: 110), controlPoint1: CGPoint(x: 181.5, y: 9.1), controlPoint2: CGPoint(x: 166.2, y: 42.4))
        bezierPath.addCurve(to: CGPoint(x: 133.5, y: 132.6), controlPoint1: CGPoint(x: 134.2, y: 137.5), controlPoint2: CGPoint(x: 134.2, y: 137.5))
        bezierPath.addCurve(to: CGPoint(x: 135.3, y: 40), controlPoint1: CGPoint(x: 132.3, y: 124.9), controlPoint2: CGPoint(x: 133.7, y: 54))
        bezierPath.addCurve(to: CGPoint(x: 135.9, y: 25.2), controlPoint1: CGPoint(x: 136.2, y: 32.5), controlPoint2: CGPoint(x: 136.4, y: 26.6))
        bezierPath.addCurve(to: CGPoint(x: 105.1, y: 11.4), controlPoint1: CGPoint(x: 134.1, y: 20.4), controlPoint2: CGPoint(x: 117.8, y: 13.1))
        bezierPath.addCurve(to: CGPoint(x: 96, y: 13.5), controlPoint1: CGPoint(x: 100.5, y: 10.8), controlPoint2: CGPoint(x: 99.5, y: 11))
        bezierPath.addCurve(to: CGPoint(x: 58.7, y: 61.5), controlPoint1: CGPoint(x: 85.2, y: 21), controlPoint2: CGPoint(x: 71, y: 39.3))
        bezierPath.addCurve(to: CGPoint(x: 0.8, y: 247.4), controlPoint1: CGPoint(x: 32.6, y: 108.5), controlPoint2: CGPoint(x: 6.2, y: 193.4))
        bezierPath.addLine(to: CGPoint(x: -0.4, y: 260.3))
        bezierPath.addLine(to: CGPoint(x: 3.9, y: 264.1))
        bezierPath.addCurve(to: CGPoint(x: 7.5, y: 268), controlPoint1: CGPoint(x: 6.3, y: 266.3), controlPoint2: CGPoint(x: 7.9, y: 268))
        bezierPath.addCurve(to: CGPoint(x: 9, y: 270.5), controlPoint1: CGPoint(x: 7, y: 268), controlPoint2: CGPoint(x: 7.7, y: 269.1))
        bezierPath.addCurve(to: CGPoint(x: 33.3, y: 279.8), controlPoint1: CGPoint(x: 12.1, y: 273.8), controlPoint2: CGPoint(x: 26, y: 279.1))
        bezierPath.addCurve(to: CGPoint(x: 43.1, y: 276.4), controlPoint1: CGPoint(x: 38.9, y: 280.3), controlPoint2: CGPoint(x: 39.2, y: 280.2))
        bezierPath.addCurve(to: CGPoint(x: 61.4, y: 240.1), controlPoint1: CGPoint(x: 47.9, y: 271.8), controlPoint2: CGPoint(x: 57.3, y: 253.2))
        bezierPath.addCurve(to: CGPoint(x: 62.9, y: 228.3), controlPoint1: CGPoint(x: 63.7, y: 232.9), controlPoint2: CGPoint(x: 63.9, y: 231.2))
        bezierPath.addCurve(to: CGPoint(x: 59.4, y: 223.8), controlPoint1: CGPoint(x: 62.3, y: 226.4), controlPoint2: CGPoint(x: 60.8, y: 224.4))
        bezierPath.addCurve(to: CGPoint(x: 59.1, y: 208.3), controlPoint1: CGPoint(x: 56.5, y: 222.4), controlPoint2: CGPoint(x: 56.5, y: 221.9))
        bezierPath.addCurve(to: CGPoint(x: 81.7, y: 125.8), controlPoint1: CGPoint(x: 63.8, y: 183.3), controlPoint2: CGPoint(x: 72.8, y: 150.6))
        bezierPath.addLine(to: CGPoint(x: 86.5, y: 112.6))
        bezierPath.addLine(to: CGPoint(x: 87.2, y: 136.6))
        bezierPath.addCurve(to: CGPoint(x: 95.5, y: 236.4), controlPoint1: CGPoint(x: 88.4, y: 178.9), controlPoint2: CGPoint(x: 92.7, y: 230.4))
        bezierPath.addCurve(to: CGPoint(x: 110.9, y: 253.9), controlPoint1: CGPoint(x: 98.1, y: 241.8), controlPoint2: CGPoint(x: 106.9, y: 251.9))
        bezierPath.addCurve(to: CGPoint(x: 131, y: 257.1), controlPoint1: CGPoint(x: 116.3, y: 256.7), controlPoint2: CGPoint(x: 125.9, y: 258.2))
        bezierPath.addCurve(to: CGPoint(x: 139.6, y: 251.3), controlPoint1: CGPoint(x: 134, y: 256.4), controlPoint2: CGPoint(x: 136.3, y: 254.9))
        bezierPath.addCurve(to: CGPoint(x: 146, y: 232.5), controlPoint1: CGPoint(x: 144.6, y: 245.9), controlPoint2: CGPoint(x: 144.5, y: 246.3))
        bezierPath.addCurve(to: CGPoint(x: 176.9, y: 118.5), controlPoint1: CGPoint(x: 149, y: 204.4), controlPoint2: CGPoint(x: 162.4, y: 155.2))
        bezierPath.addLine(to: CGPoint(x: 180.9, y: 108.5))
        bezierPath.addLine(to: CGPoint(x: 181, y: 121.5))
        bezierPath.addCurve(to: CGPoint(x: 187, y: 238.5), controlPoint1: CGPoint(x: 181.2, y: 160.3), controlPoint2: CGPoint(x: 184, y: 214.6))
        bezierPath.addCurve(to: CGPoint(x: 197.2, y: 270.1), controlPoint1: CGPoint(x: 189.6, y: 258.5), controlPoint2: CGPoint(x: 191, y: 263))
        bezierPath.addCurve(to: CGPoint(x: 221.8, y: 281.1), controlPoint1: CGPoint(x: 202.8, y: 276.6), controlPoint2: CGPoint(x: 208.2, y: 279))
        bezierPath.addCurve(to: CGPoint(x: 241.7, y: 275.7), controlPoint1: CGPoint(x: 232.3, y: 282.7), controlPoint2: CGPoint(x: 235.4, y: 281.8))
        bezierPath.addCurve(to: CGPoint(x: 244.5, y: 248.4), controlPoint1: CGPoint(x: 248, y: 269.5), controlPoint2: CGPoint(x: 247.9, y: 270.2))
        bezierPath.addCurve(to: CGPoint(x: 233.1, y: 47.7), controlPoint1: CGPoint(x: 235.3, y: 190), controlPoint2: CGPoint(x: 231.2, y: 117.6))
        bezierPath.addCurve(to: CGPoint(x: 231.9, y: 10.4), controlPoint1: CGPoint(x: 234, y: 12.8), controlPoint2: CGPoint(x: 234, y: 12.7))
        bezierPath.addCurve(to: CGPoint(x: 212.3, y: 1.9), controlPoint1: CGPoint(x: 229.2, y: 7.6), controlPoint2: CGPoint(x: 222, y: 4.4))
        bezierPath.addCurve(to: CGPoint(x: 193.3, y: 1.9), controlPoint1: CGPoint(x: 202.7, y: -0.5), controlPoint2: CGPoint(x: 197.4, y: -0.5))
        bezierPath.close()
        return bezierPath
    }
    
    // "e"字母SVG图形的贝塞尔路径
    static var SVG_e_Letter: UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 60.14, y: 1.38))
        bezierPath.addCurve(to: CGPoint(x: 22.84, y: 40.88), controlPoint1: CGPoint(x: 47.04, y: 5.38), controlPoint2: CGPoint(x: 33.34, y: 19.98))
        bezierPath.addCurve(to: CGPoint(x: 0.14, y: 131.38), controlPoint1: CGPoint(x: 10.24, y: 65.98), controlPoint2: CGPoint(x: 1.44, y: 101.08))
        bezierPath.addCurve(to: CGPoint(x: 16.14, y: 185.18), controlPoint1: CGPoint(x: -0.86, y: 154.68), controlPoint2: CGPoint(x: 3.34, y: 168.78))
        bezierPath.addCurve(to: CGPoint(x: 48.34, y: 208.88), controlPoint1: CGPoint(x: 26.84, y: 198.88), controlPoint2: CGPoint(x: 34.74, y: 204.68))
        bezierPath.addCurve(to: CGPoint(x: 93.74, y: 205.38), controlPoint1: CGPoint(x: 63.54, y: 213.48), controlPoint2: CGPoint(x: 79.04, y: 212.28))
        bezierPath.addCurve(to: CGPoint(x: 135.14, y: 148.38), controlPoint1: CGPoint(x: 111.04, y: 197.08), controlPoint2: CGPoint(x: 130.14, y: 170.78))
        bezierPath.addCurve(to: CGPoint(x: 133.24, y: 117.78), controlPoint1: CGPoint(x: 138.64, y: 132.58), controlPoint2: CGPoint(x: 138.14, y: 124.88))
        bezierPath.addCurve(to: CGPoint(x: 115.04, y: 109.38), controlPoint1: CGPoint(x: 129.24, y: 111.98), controlPoint2: CGPoint(x: 123.64, y: 109.38))
        bezierPath.addCurve(to: CGPoint(x: 104.74, y: 112.68), controlPoint1: CGPoint(x: 107.94, y: 109.38), controlPoint2: CGPoint(x: 107.54, y: 109.48))
        bezierPath.addCurve(to: CGPoint(x: 101.84, y: 118.48), controlPoint1: CGPoint(x: 103.14, y: 114.48), controlPoint2: CGPoint(x: 101.84, y: 117.08))
        bezierPath.addCurve(to: CGPoint(x: 99.24, y: 128.68), controlPoint1: CGPoint(x: 101.84, y: 119.88), controlPoint2: CGPoint(x: 100.64, y: 124.48))
        bezierPath.addCurve(to: CGPoint(x: 60.64, y: 167.88), controlPoint1: CGPoint(x: 91.84, y: 150.88), controlPoint2: CGPoint(x: 75.14, y: 167.88))
        bezierPath.addCurve(to: CGPoint(x: 46.24, y: 152.68), controlPoint1: CGPoint(x: 51.34, y: 167.88), controlPoint2: CGPoint(x: 47.24, y: 163.48))
        bezierPath.addCurve(to: CGPoint(x: 48.64, y: 127.68), controlPoint1: CGPoint(x: 45.54, y: 146.08), controlPoint2: CGPoint(x: 47.24, y: 129.08))
        bezierPath.addCurve(to: CGPoint(x: 55.84, y: 130.08), controlPoint1: CGPoint(x: 49.04, y: 127.28), controlPoint2: CGPoint(x: 52.34, y: 128.28))
        bezierPath.addCurve(to: CGPoint(x: 76.54, y: 132.48), controlPoint1: CGPoint(x: 63.84, y: 133.98), controlPoint2: CGPoint(x: 69.94, y: 134.68))
        bezierPath.addCurve(to: CGPoint(x: 91.84, y: 120.78), controlPoint1: CGPoint(x: 81.24, y: 130.98), controlPoint2: CGPoint(x: 91.84, y: 122.78))
        bezierPath.addCurve(to: CGPoint(x: 95.74, y: 115.08), controlPoint1: CGPoint(x: 91.84, y: 120.18), controlPoint2: CGPoint(x: 93.64, y: 117.68))
        bezierPath.addCurve(to: CGPoint(x: 115.14, y: 51.98), controlPoint1: CGPoint(x: 107.34, y: 101.08), controlPoint2: CGPoint(x: 114.84, y: 76.68))
        bezierPath.addCurve(to: CGPoint(x: 110.14, y: 25.18), controlPoint1: CGPoint(x: 115.24, y: 40.38), controlPoint2: CGPoint(x: 113.94, y: 33.18))
        bezierPath.addCurve(to: CGPoint(x: 93.14, y: 6.18), controlPoint1: CGPoint(x: 107.14, y: 18.68), controlPoint2: CGPoint(x: 99.04, y: 9.68))
        bezierPath.addCurve(to: CGPoint(x: 60.14, y: 1.38), controlPoint1: CGPoint(x: 83.24, y: 0.38), controlPoint2: CGPoint(x: 69.64, y: -1.62))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 70.54, y: 54.58))
        bezierPath.addCurve(to: CGPoint(x: 59.34, y: 92.38), controlPoint1: CGPoint(x: 69.44, y: 69.28), controlPoint2: CGPoint(x: 64.44, y: 85.98))
        bezierPath.addCurve(to: CGPoint(x: 57.54, y: 85.48), controlPoint1: CGPoint(x: 56.74, y: 95.68), controlPoint2: CGPoint(x: 55.84, y: 92.48))
        bezierPath.addCurve(to: CGPoint(x: 70.64, y: 45.88), controlPoint1: CGPoint(x: 60.34, y: 73.18), controlPoint2: CGPoint(x: 69.44, y: 45.88))
        bezierPath.addCurve(to: CGPoint(x: 70.54, y: 54.58), controlPoint1: CGPoint(x: 70.94, y: 45.88), controlPoint2: CGPoint(x: 70.84, y: 49.78))
        bezierPath.close()
        return bezierPath
    }
}

    

