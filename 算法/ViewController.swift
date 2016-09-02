//
//  ViewController.swift
//  算法
//
//  Created by Dengshengbin on 16/7/23.
//  Copyright © 2016年 面包旅行. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //冒泡排序
        bubble()
        
        //快速排序
        var a_swift = [0, 5, 2, 8, 1234, -1, 2, 10, 9, 9, 12]
        let swift_start:UInt64 = mach_absolute_time();
        print("swift_start: \(swift_start)")
        quicksort_swift(&a_swift, start: 0, end: a_swift.count)
        let swift_stop:UInt64 = mach_absolute_time();
        print(swift_stop)
        print(a_swift)
        
        //快速排序
        let randomNumbers = [23, 32, 43, 96, 54, 67, 90, 234, 16, 42, 65, 89, 98, 86, 302, 10]
        let x = quickSort(randomNumbers)
        print(x)
        
        //递归求和
        print("recursionSun  : \(recursionSum(4))")
        
        //递归求数组最大值
        let recursionMaxArray = [1, 4, 9, 12, 8, 33, 10]
        print("recursionMax : \(recursionMax(recursionMaxArray))")
        
        //递归求兔子
        print("rabbit : \(recursionRabbit(4, num: 2))")
        
        //二分法查找指定值的位置
        let dichotomieValue = 5
        let dichotomieArray = [1,3, 5, 6, 7, 8, 11, 12, 134]
        print("dichotomie Index : \(dichotomieConfigValue(dichotomieArray, value: dichotomieValue))")
        
        let abc = "sdkdkdkjjdkkkdllldddjd"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

/*
 * 冒泡顺序
 * http://blog.csdn.net/Emperor_huanzi/article/details/51423827
 */
func bubble() {
    
    var bubbleArray = [1, 3, 9, 2, 12, 9, 8, 6, 7]
    for i in 0 ..< bubbleArray.count {

        for j in i ..< bubbleArray.count - 1{
            let value1 = bubbleArray[j]
            let value2 = bubbleArray[j+1]
            if value1 > value2 {
                let transitionValue = value1
                bubbleArray[j] = value2
                bubbleArray[j+1] = transitionValue
            }
        }
    }
    print("bubbleArray : \(bubbleArray)")
}

/*
 * 快速排序
 * http://www.iqiyi.com/v_19rrhzyeqs.html
 */

func quicksort_swift(inout a:[Int], start:Int, end:Int) {
    if (end - start < 2){
        return
    }
    let p = a[start + (end - start)/2]
    var l = start
    var r = end - 1
    while (l <= r){
        if (a[l] < p){
            l += 1
            continue
        }
        if (a[r] > p){
            r -= 1
            continue
        }
        let t = a[l]
        a[l] = a[r]
        a[r] = t
        l += 1
        r -= 1
    }
    quicksort_swift(&a, start: start, end: r + 1)
    quicksort_swift(&a, start: r + 1, end: end)
}

//取第一个元素作为标尺，<标尺的放左边数组，>标尺的放右边数组，等于标尺的放中间数组，然后分别对左右数组进行递归。
func quickSort(arrayOfIntegers:[Int]) -> [Int] {
    
    var leftOfWall = [Int]()
    var wall = [Int]()
    var rightOfWall = [Int]()
    
    if arrayOfIntegers.count > 1 {
        
        for x in arrayOfIntegers {
            let pivot = arrayOfIntegers[0]
            if x < pivot {
                leftOfWall.append(x)
            } else if x == pivot {
                wall.append(x)
            } else {
                rightOfWall.append(x)
            }
        }
        return(quickSort(leftOfWall) + wall + quickSort(rightOfWall))
    } else {
        return arrayOfIntegers
    }
}


/*
 * 快速排序
 */
//func quickSort(arrayOfIntegers: [Int])->Array<Int> {
//    
//    var leftOfWall = [Int]()
//    var wall = [Int]()
//    var rightOfWall = [Int]()
//    
//    if arrayOfIntegers.count > 1{
//        let pivot = arrayOfIntegers[0]
//        
//        for x in arrayOfIntegers {
//            if x < pivot{
//                leftOfWall.append(x)
//            }
//            else if x == pivot {
//                wall.append(x)
//            }
//            else if x > pivot {
//                rightOfWall.append(x)
//            }
//        }
//        print("one")
//        return (quickSort(leftOfWall)+wall+quickSort(rightOfWall))
//        
//    }
//        
//    else {
//        print("two")
//        return arrayOfIntegers
//    }
//}

/*
 * 递归
 * 递归必须满足以下条件:
     1） 在每一次调用自己时，必须是（在某种意义上）更接近于解；
     2） 必须有一个终止处理或计算的准则。
 * http://baike.baidu.com/link?url=XHkj2iIg5uRC3Q7A6kALnpNOESmvYCRUIwk396aC1YAVSo8I9WNEwqX-v7GWYjsj20IeYGPbG1SJkp5mjg_4RK
 */

//递归求和
func recursionSum(n: Int) -> Int {
    if n == 0 {
        return n
    }
    return(n + recursionSum(n - 1))
}

//递归数组最大值
func recursionMax(array: [Int]) -> Int {
    if array.count == 1 {
        return array[0]
    }
    
    var subArray = array
    let max = array[0]
    if max < array[1] {
        subArray.removeAtIndex(0)
    } else {
        subArray.removeAtIndex(1)
    }
    return recursionMax(subArray)
}

//递归求兔子
func recursionRabbit(n: Int, num: Int) -> Int {
    if n < 2 {
        return num
    }
    return recursionRabbit(n - 2, num: num*2)
}

/*
 * 二分法
 * 数据必须是排好序的才能使用二分法
 * http://baike.baidu.com/link?url=g2IAbYGlHYz1z2oAGNUMJ1Gw7if4Zhwoc-K3CWrVTR7eM5nH5HWgKhZKOYYgEDXc-q5xqGk7N8dA5-hIc4J3_JI6UWymIaIbudK7XMVamLe
 */
func dichotomieConfigValue(intArray: [Int], value: Int) -> Int {
    
    var start = 0
    var end = intArray.count - 1
    var index = 0
    while start <= end {
        index = (start + end) / 2
        if intArray[index] == value {
            return index
        } else if intArray[index] > value {
            end = index - 1
        } else {
            start = index + 1
        }
    }
    return index
}

/*
 * 归并排序 http://baike.baidu.com/link?url=uqaZwQDgp2tZ7ofHSoqadY0n240iqW0fS7JL8nd3GDPaJtsTr14O8wJW5gaykTtJQf9TtR5b-8T5i3YVx9n03_#6
*/
//func mergeSort(intArray: [Int]) -> [Int] {
//    
//}

func merge(leftArray: [Int], rightArray: [Int]) {
    var leftIndex = 0
    var rightIndex = 0
    
    var result = [Int]()
    
}


