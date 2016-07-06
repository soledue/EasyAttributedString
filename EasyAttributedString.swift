//
//  EasyAttributedString.swift
//  IntesaSanpaolo
//
//  Created by Ivo Kanev on 06/07/16.
//  Copyright © 2016 Open Reply. All rights reserved.
//


public extension String {
    var typeset: TypeSet {
        return TypeSet(string: self)
    }
}
public class TypeSet {
    var s: String
    var a: NSMutableAttributedString
    var r: NSRange
    init(string s: String) {
        self.s = s
        self.a = NSMutableAttributedString(string: s)
        self.r = NSString(string: s).rangeOfString(s)
    }
    func color(color c: UIColor)-> TypeSet {
        a.addAttributes([NSForegroundColorAttributeName: c], range: r)
        return self
    }
    func font(font f: UIFont)->TypeSet {
        a.addAttributes([NSFontAttributeName: f], range: r)
        return self
    }
    var string: NSAttributedString {
        return a
    }
    func contains(substring: String) -> TypeSet {
        r = NSString(string: s).rangeOfString(substring)
        return self
    }
    func range(from: Int, lenght: Int) -> TypeSet {
        if (from  <= s.characters.count) && (from + lenght) <= s.characters.count {
            r = NSMakeRange(from, lenght)
        }
        return self
    }
}
