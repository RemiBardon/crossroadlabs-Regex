//===--- String+RegExp.swift -----------------------------------------------===//
//Copyright (c) 2016 Daniel Leping (dileping)
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//===----------------------------------------------------------------------===//

/**
 * Adds RegExp extensions to String
 */
public extension String {
    /**
     * Creates a regex using this string as a pattern. Can return nil if pattern is invalid.
     */
    var r : RegExp? {
        get {
            return try? RegExp(pattern: self)
        }
    }
    
    /**
     An inverse alias to RegExp.split
     
     - parameters:
       - regex: RegExp to split the string with
     - returns: An array. See RegExp.split for more details.
     */
    func split(using regex:RegExpProtocol?) -> [String] {
        guard let regex = regex else {
            return [self]
        }
        return regex.split(self)
    }
}

infix operator =~ : ComparisonPrecedence
infix operator !~ : ComparisonPrecedence

/**
 Syntactic sugar for pattern matching. Used as "ABC" =~ ".*".r
 
 - see: RegExp.matches for more details.
 - parameters:
   - source: String to match
   - regex: RegExp to match the string with
 - returns: True if matches, false otherwise
 */
public func =~(source:String, regex:RegExpProtocol?) -> Bool {
    guard let matches = regex?.matches(source) else {
        return false
    }
    return matches
}

/**
 Syntactic sugar for pattern matching. Used as "ABC" =~ ".*"
 RegExp is automatically created from the second string.
 
 - see: RegExp.matches for more details
 - parameters:
   - source: String to match
   - regex: Pattern string to match the string with
 - returns: True if matches, false otherwise
 */
public func =~(source:String, pattern:String) -> Bool {
    return source =~ pattern.r
}

/**
 Syntactic sugar for pattern matching. Used as "ABC" !~ ".*".r
 Basically is negation of =~ operator.
 
 - see: RegExp.matches for more details
 - parameters:
   - source: String to match
   - regex: RegExp to match the string with
 - returns: False if matches, true otherwise
 */
public func !~(source:String, regex:RegExpProtocol?) -> Bool {
    return !(source =~ regex)
}

/**
 Syntactic sugar for pattern matching. Used as "ABC" =~ ".*"
 Basically is negation of =~ operator.
 
 RegExp is automatically created from the second string.
 
 - see: RegExp.matches for more details
 - parameters:
   - source: String to match
   - regex: Pattern string to match the string with
 - returns: False if matches, true otherwise
 */
public func !~(source:String, pattern:String) -> Bool {
    return !(source =~ pattern.r)
}

/**
 Operator is used by `switch` keyword in constructions like following:
 
 ```swift
 switch str {
    case "\\d+".r: print("has digit")
    case "[a-z]+".r: print("has letter")
    default: print("nothing")
 }
 ```
 
 Deep integration with Swift.
 
 - returns: True if matches, false otherwise
 */
public func ~=(regex:RegExpProtocol?, source:String) -> Bool {
    return source =~ regex
}
