extension String?{
    var isNilOrEmpty: Bool{
        self == nil || self?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    }
}
extension String{
    var isEmpty: Bool{
         self.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    }
}
