extension Sequence {
    // This returns a new sequence that is sorted based on a key path.
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        sorted { a, b in
            a[keyPath: keyPath] < b[keyPath: keyPath]
        }
    }

    // This returns a new sequence that is sorted in a case-insensitive manner
    // based on a key path to String values.
    func sortedInsensitive(by keyPath: KeyPath<Element, String>)
        -> [Element] {
        sorted { lhs, rhs -> Bool in
            let ld = lhs[keyPath: keyPath]
            let rd = rhs[keyPath: keyPath]
            return ld.localizedCaseInsensitiveCompare(rd) == .orderedAscending
        }
    }
}
