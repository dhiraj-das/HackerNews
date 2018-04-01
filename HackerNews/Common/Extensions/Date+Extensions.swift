//
//  Date+Extensions.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/1/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation

extension Date {
    
    public var timeAgo: String {
        let components = self.dateComponents()
        
        if let year = components.year, year > 0 {
            if year < 2 {
                return "Last year"
            } else {
                return "\(year) years ago"
            }
        }
        
        if let month = components.month, month > 0 {
            if month < 2 {
                return "Last month"
            } else {
                return "\(month) months ago"
            }
        }
        
        if let day = components.day {
            if day >= 7 {
                let week = day / 7
                if week < 2 {
                    return "Last week"
                } else {
                    return "\(week) weeks ago"
                }
            } else if day > 0  {
                if day < 2 {
                    return "Yesterday"
                } else  {
                    return "\(day) days ago"
                }
            }
        }
        
        if let hour = components.hour, hour > 0 {
            if hour < 2 {
                return "An hour ago"
            } else  {
                return "\(hour) hours ago"
            }
        }
        
        if let minute = components.minute, minute > 0 {
            if minute < 2 {
                return "A minute ago"
            } else {
                return "\(minute) minutes ago"
            }
        }
        
        if let second = components.second, second > 0 {
            if second < 5 {
                return "Just now"
            } else {
                return "\(second) seconds ago"
            }
        }
        
        return ""
    }
    
    fileprivate func dateComponents() -> DateComponents {
        return Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self, to: Date())
    }
}
