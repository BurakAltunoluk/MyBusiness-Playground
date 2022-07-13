import Foundation

enum staffTitleType {
    case authorized
    case assistant
}

struct CreateNewCompany {
    var bussinessName: String
    var bussinessBudget: Int
    var authorizedStaff: [String : Int]
    var assistantStaff: [String : Int]
    
    mutating func addNewStaff (StaffTitle: staffTitleType, Name: String, Age: Int) {
        switch StaffTitle {
        case .authorized: authorizedStaff[Name] = Age
        case .assistant: assistantStaff[Name] = Age
        }
    }
    
    mutating func addIncomeOrExpense(incomeOrExpence:Int) {
        bussinessBudget += incomeOrExpence
    }
    
    mutating func payAllWages() -> Int {
        var totalWages = 0
        
        for (_,Ages) in authorizedStaff {
            totalWages += Ages * 200 + 10000
        }
        for (_,Ages) in assistantStaff {
            totalWages += Ages * 100 + 10000
        }
        bussinessBudget -= totalWages
        return totalWages
    }
    
    func numberOfStaff() -> String {
        return """
                Authorized Staff:  \(authorizedStaff.count),
                Assistant Staff: \(assistantStaff.count),
                Total: \(assistantStaff.count + authorizedStaff.count)
         """
    }
    
    func staffWagesSeachByName(StaffTitle: staffTitleType ,Name: String) {
        
        if StaffTitle == .assistant && assistantStaff[Name] != nil {
            print("\(Name)'s wage is $\(Int(assistantStaff[Name]!) * 100 + 10000)")
        } else if StaffTitle == .authorized && authorizedStaff[Name] != nil {
            print("\(Name)'s wage is $\(Int(authorizedStaff[Name]!) * 200 + 10000)")
        } else {
            print("Staff is not found")
            
        }
    }
    
}

//--------------------------

//CreateNewCompany

/*
 
 funcs
 -addNewStaff()
 -addIncomeOrExpence()
 -payAllWages()
 -staffWagesSeachByName()
 -numberOfStaff()
 
 */

// Example

var StarLtd = CreateNewCompany(bussinessName: "Star LTD", bussinessBudget: 50000, authorizedStaff: [:], assistantStaff: [:])

StarLtd.bussinessName
StarLtd.bussinessBudget

StarLtd.addNewStaff(StaffTitle: .authorized, Name: "Sam Brown", Age: 38)
StarLtd.addNewStaff(StaffTitle: .assistant, Name: "Paul Fly", Age: 24)
StarLtd.addNewStaff(StaffTitle: .assistant, Name: "Allen Gear", Age: 23)

StarLtd.numberOfStaff()

StarLtd.staffWagesSeachByName(StaffTitle: .authorized, Name: "Sam Brown")
StarLtd.staffWagesSeachByName(StaffTitle: .assistant, Name: "Paul Fly")
StarLtd.staffWagesSeachByName(StaffTitle: .assistant, Name: "Allen Gear")

StarLtd.payAllWages()
StarLtd.bussinessBudget

StarLtd.addIncomeOrExpense(incomeOrExpence: 20000)
StarLtd.bussinessBudget
print("h")
