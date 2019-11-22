//
//  BeDirectionalLayout.swift
//  StatVBL
//
//  Created by Angels It on 22.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol BeDirectionalViewLayoutDelegate: class {
    func numberOfColumns() -> Int
}

final class BeDirectionalLayout: UICollectionViewLayout {
    
    // MARK: - Private properties

    private var itemAttributes = [[UICollectionViewLayoutAttributes]]()
    private var itemsSize = [CGSize]()
    private var contentSize: CGSize = .zero
    private let delegate: BeDirectionalViewLayoutDelegate
    
    // MARK: - Initializers
    
    init(delegate: BeDirectionalViewLayoutDelegate) {
        self.delegate = delegate
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Superclass properties
    
    override var collectionViewContentSize: CGSize {
        return contentSize
    }
    
    // MARK: - Superclass functions

    override func prepare() {
        guard let collectionView = collectionView else {
            return
        }
        if collectionView.numberOfSections == 0 {
            return
        }
        if itemAttributes.count != collectionView.numberOfSections {
            generateItemAttributes(collectionView: collectionView)
            return
        }
        for section in 0..<collectionView.numberOfSections {
            for item in 0..<collectionView.numberOfItems(inSection: section) {
                if section != 0 && item != 0 {
                    continue
                }
                let attributes = layoutAttributesForItem(at: IndexPath(item: item, section: section))!
                if section == 0 {
                    var frame = attributes.frame
                    frame.origin.y = collectionView.contentOffset.y
                    attributes.frame = frame
                }
                if item == 0 {
                    var frame = attributes.frame
                    frame.origin.x = collectionView.contentOffset.x
                    attributes.frame = frame
                }
            }
        }

    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return itemAttributes[indexPath.section][indexPath.row]
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = [UICollectionViewLayoutAttributes]()
        for section in itemAttributes {
            let filteredArray = section.filter { obj -> Bool in
                return rect.intersects(obj.frame)
            }
            attributes.append(contentsOf: filteredArray)
        }
        return attributes
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}

// MARK: - Helpers

private extension BeDirectionalLayout {

    func generateItemAttributes(collectionView: UICollectionView) {
        if itemsSize.count != delegate.numberOfColumns() {
            calculateItemSizes()
        }

        var column = 0
        var xOffset: CGFloat = 0
        var yOffset: CGFloat = 0
        var contentWidth: CGFloat = 0

        itemAttributes = []

        for section in 0..<collectionView.numberOfSections {
            var sectionAttributes: [UICollectionViewLayoutAttributes] = []

            for index in 0..<delegate.numberOfColumns() {
                let itemSize = itemsSize[index]
                let indexPath = IndexPath(item: index, section: section)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = CGRect(x: xOffset, y: yOffset, width: itemSize.width, height: itemSize.height).integral

                if section == 0 && index == 0 {
                    attributes.zIndex = 2
                } else if section == 0 || index == 0 {
                    attributes.zIndex = 1
                }

                if section == 0 {
                    var frame = attributes.frame
                    frame.origin.y = collectionView.contentOffset.y
                    attributes.frame = frame
                }
                if index == 0 {
                    var frame = attributes.frame
                    frame.origin.x = collectionView.contentOffset.x
                    attributes.frame = frame
                }

                sectionAttributes.append(attributes)

                xOffset += itemSize.width
                column += 1
                
                if column == delegate.numberOfColumns() {
                    if xOffset > contentWidth {
                        contentWidth = xOffset
                    }
                    column = 0
                    xOffset = 0
                    yOffset += itemSize.height
                }
            }
            itemAttributes.append(sectionAttributes)
        }
        if let attributes = itemAttributes.last?.last {
            contentSize = CGSize(width: contentWidth, height: attributes.frame.maxY)
        }
    }

    func calculateItemSizes() {
        itemsSize = []
        for index in 0..<delegate.numberOfColumns() {
            itemsSize.append(sizeForItemWithColumnIndex(index))
        }
    }

    func sizeForItemWithColumnIndex(_ columnIndex: Int) -> CGSize {
        if columnIndex == 0 {
            return CGSize(width: 120, height: 60)
        }
        return CGSize(width: 60, height: 60)
    }

}
