import Foundation

let cafe1 = "café"
let cafe2 = "cafe\u{0301}"

print(cafe1)
print(cafe2)

print(cafe1.count)
print(cafe2.count)

for c in cafe1 {
    print(c)
}

for c in cafe2 {
    print(c)
}

for codePoint in cafe1.unicodeScalars {
    print(codePoint.value, separator: " ", terminator: " ")
}

print("")

for codePoint in cafe2.unicodeScalars {
    print(codePoint.value, separator: " ", terminator: " ")
}

print("")

let a = 0x301
let b = 769

if a == b {
    print("a == b")
    print(a)
}

/*
 café
 café
 4
 4
 c
 a
 f
 é
 c
 a
 f
 é
 99 97 102 233
 99 97 102 101 769
 a == b
 769
*/
