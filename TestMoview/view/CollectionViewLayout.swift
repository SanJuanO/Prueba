//
//  CategoriesCollectionViewLayout.swift
//  RecompensasSuperAuto
//
//  Created by Sergio Acosta Vega on 17/6/21.
//

import UIKit

class CollectionViewLayout: UICollectionViewLayout {
    fileprivate var numberOfColumns = 2
    fileprivate var cellPadding: CGFloat = 10
    
    fileprivate var contentHeight: CGFloat = 0
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return UIScreen.main.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    override func prepare() {

        guard let collectionView = collectionView else {
            return
        }
        self.cache = []
        self.contentHeight = 0.0
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)

        // 3. Iterates through the list of items in the first section
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            var insetFrame: CGRect = .zero
            var frame: CGRect = .zero
            var height: CGFloat = 0.0
            
                height = cellPadding*10 +  columnWidth
                
          
            
            frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            insetFrame = frame.insetBy(dx: 10.0, dy: cellPadding)

            // 5. Creates an UICollectionViewLayoutItem with the frame and add it to the cache
            
            attributes.frame = insetFrame
            cache.append(attributes)
            
            // 6. Updates the collection view content height
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Loop through the cache and look for items in the rect
        for attributes in cache {
            
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        
        return visibleLayoutAttributes
    }
}
