import Foundation

protocol Account {
    associatedtype Currency
    
    // read-only property
    var balance: Currency { get }
    
    func deposit(amount: Currency)
    func withdraw(amount: Currency)
}

typealias Dollars = Double

class BasicAccount: Account {
    // still visible, but not able to set externally
    private(set) var balance: Dollars = 0.0
    
    func deposit(amount: Double) {
        self.balance += amount
    }
    
    func withdraw(amount: Double) {
        if amount <= balance {
            balance -= amount
        } else {
            balance = 0
        }
    }
}

class CheckingAccount: BasicAccount {
    private let accountNumber = UUID().uuidString
    
    class Check {
        let account: String
        var amount: Dollars
        private(set) var cashed = false
        
        func cash() {
            cashed = true
        }
        
        init(amount: Dollars, from account: CheckingAccount) {
            self.amount = amount
            self.account = account.accountNumber
        }
    }
    
    func writeCheck(amount: Dollars) -> Check? {
        // Check for sufficient balance before withdrawing the amount
        // and creating the check
        guard balance > amount else {
            return nil
        }
        
        let check = Check(amount: amount, from: self)
        self.withdraw(amount: check.amount)
        
        return check
    }
    
    func deposit(_ check: Check) {
        // Will not deposit the check if it has already been cashed!
        guard !check.cashed else {
            return
        }
        
        self.deposit(amount: check.amount)
        check.cash()
    }
}

let account = BasicAccount()
print(account.balance)

// Test checking account
let fooCheckingAccount = CheckingAccount()
fooCheckingAccount.deposit(amount: 500.00)
print(fooCheckingAccount.balance)

let fooCheck = fooCheckingAccount.writeCheck(amount: 100.00)!
print(fooCheckingAccount.balance)

let marryCheckingAccount = CheckingAccount()
print(marryCheckingAccount.balance)

marryCheckingAccount.deposit(fooCheck)
print(marryCheckingAccount.balance)

marryCheckingAccount.deposit(fooCheck) // Let's cheat the bank and see ;)
print(marryCheckingAccount.balance)

// A malicious user / stupid coder can create a check directly (we will solve this ;p)
print(fooCheckingAccount.balance)
let illegalCheck = CheckingAccount.Check(amount: 1000.00, from: fooCheckingAccount)
print(fooCheckingAccount.balance)

let illegalCheckAccount = CheckingAccount()
illegalCheckAccount.deposit(illegalCheck)
print(fooCheckingAccount.balance)
print(illegalCheckAccount.balance)
