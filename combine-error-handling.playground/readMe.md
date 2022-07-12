## Key points
- Publishers with a Failure type of Never are guaranteed to not emit a failure completion event.
- Many operators only work with infallible publishers. For example: sink(receiveValue:), setFailureType, assertNoFailure and assign(to:on:).
- The try-prefixed operators let you throw errors from within them, while non-try operators do not.
- Since Swift doesn’t support typed throws, calling try-prefixed operators erases the publisher’s Failure to a plain Swift Error.
- Use mapError to map a publisher’s Failure type, and unify all failure types in your publisher to a single type.
- When creating your own API based on other publishers with their own Failure types, wrap all possible errors into your own Error type to unify them and hide your API’s implementation details.
- You can use the retry operator to resubscribe to a failed publisher for an additional number of times.
- replaceError(with:) is useful when you want to provide a default fallback value for your publisher, in case of failure.
- Finally, you may use catch to replace a failed publisher with a different fallback publisher.
