import Cocoa

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
    case unknownPrinter
}

enum OtherError: Error {
    case unknown
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Unknown" {
        throw PrinterError.unknownPrinter
    }
    
    return "Job sent"
}

// Use do-catch to handle error

do {
    let printerResponse = try send(job: 1024, toPrinter: "Toshiba LaserJet")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1024, toPrinter: "Unknown")
    print(printerResponse)
} catch {
    print("Error:", error)
}

do {
    let printerResponse = try send(job: 1024, toPrinter: "Test")
    //throw PrinterError.outOfPaper
    //throw OtherError.unknown
    
    print(printerResponse)
} catch PrinterError.outOfPaper {
    print("Out of paper")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error)
}

// Use try? to handle error - if the function throws an error, the specific
// error is discarded and the result is nil. Otherwise, the result is an
// optional containing the value that the function returned.

let printerStatus = try? send(job: 1, toPrinter: "Unknown")

if let status = printerStatus {
    print(status)
} else {
    print("Error: failed to send print job")
}
