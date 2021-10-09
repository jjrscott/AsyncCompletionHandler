This project contains a number of convenience functions for working with completion handler based functions and the new `async`/`await` keywords.
Their purpose is to ease the transition from completion handler based functions to `async`/`await` based functions.

There are a few classes completion handlers:

1. arbitrary non-error parameters,
2. single `Result`,
3. optional value and optional error where one, and only one is non-null (Swift default),
4. optional value and optional error where both may have a value.


#### Arbitrary non-error parameters

```swift
func getFoo(..., completion: @escaping (Foo,...)->Void)

func foo(...) async -> (Foo,...) {
  return await withCheckedThrowingContinuation { completionHandler in
    getFoo(..., completion: completionHandler)
  }
}
```

#### Single Result

```swift
func getFoo(..., completion: @escaping (Result<Foo,Error>)->Void)

func foo(...) async throws -> Foo {
  return try await withCheckedThrowingContinuation { completionHandler in
    getFoo(..., completion: completionHandler)
  }
}
```

#### Value or error

```swift
func getFoo(..., completion: @escaping (Foo?,Error?)->Void)

func foo(...) async throws -> Foo {
  return try await withCheckedThrowingContinuation { completionHandler in
    getFoo(..., completion: completionHandler)
  }
}
```

#### Value and error

```swift
func getFoo(..., completion: @escaping (Foo?,Error?)->Void)

func foo(..., response: inout Foo?) async throws {
  return try await withCheckedThrowingContinuation { completionHandler in
    getFoo(..., completion: completionHandler)
  }
}
```




### Source generation

`AsyncCompletionHandler.gyb.swift` is generated using the command:

```shell
gyb AsyncCompletionHandler.swift.gyb -o AsyncCompletionHandler.gyb.swift --line-directive ''
```

