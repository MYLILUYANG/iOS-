//
//  tantanCollectionViewLayout.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/5/30.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class tantanCollectionViewLayout: UICollectionViewLayout {

    override init() {
        super.init();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true;
    }
//    重写属性的setter getterf方法
    override var  collectionViewContentSize: CGSize {
        return CGSize(width: K_Width(width: 300), height: K_Height(height: 400));
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes.init(forCellWith: indexPath);
        
//        attributes.center = CGPoint(x: self.collectionView?.frame.size.width ?? 0 * 0.5, y: self.collectionView?.frame.size.height ?? 0 * 0.5 - K_Height(height: 50));
        
        attributes.center = CGPoint(x: CGFloat(K_ScreenW) * 0.5, y: CGFloat(K_ScreenH) * 0.5);
        
    
        var offsetsArray:Array<Int> = [0, 15, 30];

        
        if indexPath.item >= 3 {
            attributes.isHidden = true;
            
        }else{
            
            attributes.transform = CGAffineTransform(translationX: 0, y: CGFloat(Float(offsetsArray[indexPath.item])));

            attributes.size = CGSize.init(width: K_Width(width: 300) - CGFloat(offsetsArray[indexPath.item]), height: K_Height(height: 400));

            attributes.zIndex = self.collectionView!.numberOfItems(inSection: indexPath.section) - indexPath.item;
            
        }
        
        return attributes;
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var attributsArray:Array = Array<UICollectionViewLayoutAttributes>();
        
        let counta:Int = collectionView?.numberOfItems(inSection: 0) ?? 0;

        for i in 0..<counta {
            let att:UICollectionViewLayoutAttributes = collectionView?.layoutAttributesForItem(at: NSIndexPath.init(row: i, section: 0) as IndexPath) ?? UICollectionViewLayoutAttributes.init();
            attributsArray.append(att);

        }
        return attributsArray
    }
}



