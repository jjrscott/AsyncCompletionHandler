//===----------------------------------------------------------------------===//
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Copyright (c) 2021 John Scott
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

// Generate async completion handlers


/// Suspends the current task,
/// then calls the given closure with a unsafe `Result` continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a `Result` completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withUnsafeThrowingCompletionHandler<T, E: Error>(_ body: (_ resultHandler: @escaping (Result<T, E>) -> ()) -> ()) async throws -> T {
    return try await withUnsafeThrowingContinuation({ (continuation: UnsafeContinuation<T, Error>) in
        body({ (result: Result<T, E>) in
            continuation.resume(with: result)
        })
    })
}

/// Suspends the current task,
/// then calls the given closure with a unsafe continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - response: A optional type that can return a value even if the function throws.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withUnsafeThrowingCompletionHandler<T, E: Error>(response: inout T?, _ body: (_ responseHandler: @escaping (T?, E?) -> ()) -> ()) async throws {
    let result : (T?,E?) = await withUnsafeCompletionHandler(body)
    response = result.0
    if let error = result.1 {
        throw error
    }
}

/// Suspends the current task,
/// then calls the given closure with a unsafe continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withUnsafeThrowingCompletionHandler<T, E: Error>(_ body: (_ responseHandler: @escaping (T?, E?) -> ()) -> ()) async throws -> T {
    return try await withUnsafeThrowingContinuation({ (continuation: UnsafeContinuation<T, Error>) in
        body({
            if $1 != nil {
                continuation.resume(throwing: $1!)
            } else {
                continuation.resume(returning: $0!)
            }
        })
    })
}

/// Suspends the current task,
/// then calls the given closure with a unsafe continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withUnsafeCompletionHandler<T>(_ body: (_ completionHandler: @escaping (T) -> ()) -> ()) async -> T {
    return await withUnsafeContinuation({ (continuation: UnsafeContinuation<T, Never>) in
        body { continuation.resume(returning: $0) }
    })
}

/// Suspends the current task,
/// then calls the given closure with a unsafe continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withUnsafeCompletionHandler<T,U>(_ body: (_ completionHandler: @escaping (T,U) -> ()) -> ()) async -> (T,U) {
    return await withUnsafeContinuation({ (continuation: UnsafeContinuation<(T,U), Never>) in
        body { continuation.resume(returning: ($0, $1)) }
    })
}

/// Suspends the current task,
/// then calls the given closure with a unsafe continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withUnsafeCompletionHandler<T,U,V>(_ body: (_ completionHandler: @escaping (T,U,V) -> ()) -> ()) async -> (T,U,V) {
    return await withUnsafeContinuation({ (continuation: UnsafeContinuation<(T,U,V), Never>) in
        body { continuation.resume(returning: ($0, $1, $2)) }
    })
}

/// Suspends the current task,
/// then calls the given closure with a unsafe continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withUnsafeCompletionHandler<T,U,V,W>(_ body: (_ completionHandler: @escaping (T,U,V,W) -> ()) -> ()) async -> (T,U,V,W) {
    return await withUnsafeContinuation({ (continuation: UnsafeContinuation<(T,U,V,W), Never>) in
        body { continuation.resume(returning: ($0, $1, $2, $3)) }
    })
}

/// Suspends the current task,
/// then calls the given closure with a unsafe continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withUnsafeCompletionHandler<T,U,V,W,X>(_ body: (_ completionHandler: @escaping (T,U,V,W,X) -> ()) -> ()) async -> (T,U,V,W,X) {
    return await withUnsafeContinuation({ (continuation: UnsafeContinuation<(T,U,V,W,X), Never>) in
        body { continuation.resume(returning: ($0, $1, $2, $3, $4)) }
    })
}

/// Suspends the current task,
/// then calls the given closure with a unsafe continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withUnsafeCompletionHandler<T,U,V,W,X,Y>(_ body: (_ completionHandler: @escaping (T,U,V,W,X,Y) -> ()) -> ()) async -> (T,U,V,W,X,Y) {
    return await withUnsafeContinuation({ (continuation: UnsafeContinuation<(T,U,V,W,X,Y), Never>) in
        body { continuation.resume(returning: ($0, $1, $2, $3, $4, $5)) }
    })
}


/// Suspends the current task,
/// then calls the given closure with a checked `Result` continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a `Result` completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withCheckedThrowingCompletionHandler<T, E: Error>(function: String = #function, _ body: (_ resultHandler: @escaping (Result<T, E>) -> ()) -> ()) async throws -> T {
    return try await withCheckedThrowingContinuation(function: function, { (continuation: CheckedContinuation<T, Error>) in
        body({ (result: Result<T, E>) in
            continuation.resume(with: result)
        })
    })
}

/// Suspends the current task,
/// then calls the given closure with a checked continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - response: A optional type that can return a value even if the function throws.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withCheckedThrowingCompletionHandler<T, E: Error>(function: String = #function, response: inout T?, _ body: (_ responseHandler: @escaping (T?, E?) -> ()) -> ()) async throws {
    let result : (T?,E?) = await withCheckedCompletionHandler(function: function, body)
    response = result.0
    if let error = result.1 {
        throw error
    }
}

/// Suspends the current task,
/// then calls the given closure with a checked continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withCheckedThrowingCompletionHandler<T, E: Error>(function: String = #function, _ body: (_ responseHandler: @escaping (T?, E?) -> ()) -> ()) async throws -> T {
    return try await withCheckedThrowingContinuation(function: function, { (continuation: CheckedContinuation<T, Error>) in
        body({
            if $1 != nil {
                continuation.resume(throwing: $1!)
            } else {
                continuation.resume(returning: $0!)
            }
        })
    })
}

/// Suspends the current task,
/// then calls the given closure with a checked continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withCheckedCompletionHandler<T>(function: String = #function, _ body: (_ completionHandler: @escaping (T) -> ()) -> ()) async -> T {
    return await withCheckedContinuation(function: function, { (continuation: CheckedContinuation<T, Never>) in
        body { continuation.resume(returning: $0) }
    })
}

/// Suspends the current task,
/// then calls the given closure with a checked continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withCheckedCompletionHandler<T,U>(function: String = #function, _ body: (_ completionHandler: @escaping (T,U) -> ()) -> ()) async -> (T,U) {
    return await withCheckedContinuation(function: function, { (continuation: CheckedContinuation<(T,U), Never>) in
        body { continuation.resume(returning: ($0, $1)) }
    })
}

/// Suspends the current task,
/// then calls the given closure with a checked continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withCheckedCompletionHandler<T,U,V>(function: String = #function, _ body: (_ completionHandler: @escaping (T,U,V) -> ()) -> ()) async -> (T,U,V) {
    return await withCheckedContinuation(function: function, { (continuation: CheckedContinuation<(T,U,V), Never>) in
        body { continuation.resume(returning: ($0, $1, $2)) }
    })
}

/// Suspends the current task,
/// then calls the given closure with a checked continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withCheckedCompletionHandler<T,U,V,W>(function: String = #function, _ body: (_ completionHandler: @escaping (T,U,V,W) -> ()) -> ()) async -> (T,U,V,W) {
    return await withCheckedContinuation(function: function, { (continuation: CheckedContinuation<(T,U,V,W), Never>) in
        body { continuation.resume(returning: ($0, $1, $2, $3)) }
    })
}

/// Suspends the current task,
/// then calls the given closure with a checked continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withCheckedCompletionHandler<T,U,V,W,X>(function: String = #function, _ body: (_ completionHandler: @escaping (T,U,V,W,X) -> ()) -> ()) async -> (T,U,V,W,X) {
    return await withCheckedContinuation(function: function, { (continuation: CheckedContinuation<(T,U,V,W,X), Never>) in
        body { continuation.resume(returning: ($0, $1, $2, $3, $4)) }
    })
}

/// Suspends the current task,
/// then calls the given closure with a checked continuation handler for the current task.
///
/// - Parameters:
///   - function: A string identifying the declaration that is the notional
///     source for the continuation, used to identify the continuation in
///     runtime diagnostics related to misuse of this continuation.
///   - body: A closure that takes a completion handler parameter.
///     You must call the completion handler exactly once.
@available(iOS 15.0.0, *)
func withCheckedCompletionHandler<T,U,V,W,X,Y>(function: String = #function, _ body: (_ completionHandler: @escaping (T,U,V,W,X,Y) -> ()) -> ()) async -> (T,U,V,W,X,Y) {
    return await withCheckedContinuation(function: function, { (continuation: CheckedContinuation<(T,U,V,W,X,Y), Never>) in
        body { continuation.resume(returning: ($0, $1, $2, $3, $4, $5)) }
    })
}

// Local Variables:
// eval: (read-only-mode 1)
// End: