import Foundation

// utf8 - 8 code units

let c = "\u{00bd}"
print(c)

for i in c.utf8 {
    print("\(i): \(String(i, radix: 2))")
}

for i in 0...15 {
    // 10...15 - A...F in hex
    print("\(i): \(String(i, radix: 2))")
}

let c2 = "+\u{00bd}\u{21e8}\u{1f643}"
print(c2)

for i in c2.utf8 {
    print("\(i): \(String(i, radix: 2))")
}

/*
 
 ½
 194: 11000010
 189: 10111101
 0: 0
 1: 1
 2: 10
 3: 11
 4: 100
 5: 101
 6: 110
 7: 111
 8: 1000
 9: 1001
 10: 1010
 11: 1011
 12: 1100
 13: 1101
 14: 1110
 15: 1111
 +½⇨🙃
 43: 101011
 194: 11000010
 189: 10111101
 226: 11100010
 135: 10000111
 168: 10101000
 240: 11110000
 159: 10011111
 153: 10011001
 131: 10000011
 Program ended with exit code: 0
 
 */