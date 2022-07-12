## Key points
- A Scheduler defines the execution context for a piece of work.
- Apple‘s operating systems offer a rich variety of tools to help you schedule code execution.
- Combine tops these schedulers with the Scheduler protocol to help you pick the best one for the job in any given situation.
- Every time you use receive(on:), further operators in your publisher execute on the specified scheduler. That is, unless they themselves take a Scheduler parameter!

## scheduler type

- ImmediateScheduler: A simple scheduler that executes code immediately on the current thread, which is the default execution context unless modified using subscribe(on:), receive(on:) or any of the other operators which take a scheduler as parameter.
- RunLoop: Tied to Foundation’s Thread object.
- DispatchQueue: Can either be serial or concurrent.
- OperationQueue: A queue that regulates the execution of work items.
