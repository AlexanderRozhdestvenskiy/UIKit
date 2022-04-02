import UIKit

// Cuncurrency

/*
 1. Базовые примитивы
 2. GCD
 3. NSOperation
 4. Будущее
 */

// GCD

/*
 Очередь - содержит задачи на выполнение, бывает последовательная (Serial) и параллельная (Concurrent)
 
 DispatchQueue - main и global, async и sync
 DispatchGroup - enter и leave
 DispatchSemaphore - ограничение потоков
 */

let serialQueue = DispatchQueue(label: "serial")
let concurrentQueue = DispatchQueue(label: "concurrent", attributes: [.concurrent])

let mainQueue = DispatchQueue.main
let globalQueue = DispatchQueue.global(qos: .default)


let group = DispatchGroup()
group.enter() // +1
group.leave() // -1


let semaphore = DispatchSemaphore(value: 2) // максимум 2 потока


// NSOperation

/*
 "GCD - функциональный подход, а Operation - объектно-ориентированный"
 */
