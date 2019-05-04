import Foundation
import UIKit

// MARK: - UITableView extension

/// This extesion adds some useful functions to UITableView.
public extension UITableView {
    // MARK: - Functions
    
    /// Retrive all the IndexPaths for the section.
    ///
    /// - Parameter section: The section.
    /// - Returns: Return an array with all the IndexPaths.
    func indexPaths(section: Int) -> [IndexPath] {
        var indexPaths: [IndexPath] = []
        let rows: Int = numberOfRows(inSection: section)
        for index in 0 ..< rows {
            let indexPath = IndexPath(row: index, section: section)
            indexPaths.append(indexPath)
        }
        
        return indexPaths
    }
    
    /// Retrive the next index path for the given row at section.
    ///
    /// - Parameters:
    ///   - row: Row of the index path.
    ///   - section: Section of the index path
    /// - Returns: Returns the next index path.
    func nextIndexPath(row: Int, forSection section: Int) -> IndexPath? {
        let indexPath: [IndexPath] = indexPaths(section: section)
        guard indexPath != [] else {
            return nil
        }
        
        return indexPath[row + 1]
    }
    
    /// Retrive the previous index path for the given row at section
    ///
    /// - Parameters:
    ///   - row: Row of the index path.
    ///   - section: Section of the index path.
    /// - Returns: Returns the previous index path.
    func previousIndexPath(row: Int, forSection section: Int) -> IndexPath? {
        let indexPath: [IndexPath] = indexPaths(section: section)
        guard indexPath != [] else {
            return nil
        }
        
        return indexPath[row - 1]
    }
    
    /// Create an UITableView and set some parameters
    ///
    /// - Parameters:
    ///   - frame: TableView frame.
    ///   - style: TableView style.
    ///   - cellSeparatorStyle: Cell separator style.
    ///   - separatorInset: Cell separator inset.
    ///   - dataSource: TableView data source.
    ///   - delegate: TableView delegate.
    convenience init(frame: CGRect, style: UITableView.Style, cellSeparatorStyle: UITableViewCell.SeparatorStyle, separatorInset: UIEdgeInsets, dataSource: UITableViewDataSource?, delegate: UITableViewDelegate?) {
        self.init(frame: frame, style: style)
        separatorStyle = cellSeparatorStyle
        self.separatorInset = separatorInset
        self.dataSource = dataSource
        self.delegate = delegate
    }
}
