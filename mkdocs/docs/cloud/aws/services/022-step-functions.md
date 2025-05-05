
# Step Functions

- Step Functions allow to build visual workflows which are used to orchestrate Lambda Functions
- Workflow is represented as a JSON state machine
- Features:
    - Sequence
    - Parallel execution
    - Conditions
    - Timeouts
    - Error handling
- Can also integrate with EC2, ECS, on premise servers, API Gateway
- Maximum execution time is 1 year
- Possibility to implement human approval feature
- Use cases:
    - Order fulfillment
    - Data processing
    - Web applications
    - Any workflow
- When designing a Step Function we get an aspect of visualization (flow diagram)
- The execution can be visually represented on this diagram
- Any state can encounter errors:
    - State machine definition issues (example. no matching rules in choice state)
    - Task failures (example: an exception in a Lambda function)
    - Transient failures (example: network partition events)
- By default: when a state reports an error, the execution of the Step Functions fails entirely
- Failures can be retried:
    - Exponential backoff: _IntervalSeconds_, _MaxAttempts_, _BackoffRate_
    - Move on - Catch: _ErrorEquals_, _Next_
- Best practice: include data in the error message

## States

The following types of states exist:
- Pass (`"Type": "Pass"`) passes its input to its output, without performing work. `Pass` states are useful when constructing and debugging state machines.)
- Task ((`"Type": "Task"`) represents a single unit of work performed by a state machine. A task performs work by using an activity or an AWS Lambda function, by integrating with other supported AWS services, or by invoking a third-party API, such as Stripe.)
- Choice ((`"Type": "Choice"`) adds conditional logic to a state machine)
- Wait ((`"Type": "Wait"`) delays the state machine from continuing for a specified time)
- Succeed ( (`"Type": "Succeed"`) stops an execution successfully)
- Fail ((`"Type": "Fail"`) stops the execution of the state machine and marks it as a failure, unless it is caught by a `Catch` block.)
- Parallel ((`"Type": "Parallel"`) can be used to add separate branches of execution in your state machine.)
- Map (state to run a set of workflow steps for each item in a dataset. The `Map` state's iterations run in parallel, which makes it possible to process a dataset quickly)
## Amazon State Languages

A Step Functions execution receives a JSON text as input and passes that input to the first state in the workflow. Individual states receive JSON as input and usually pass JSON as output to the next state.
In the Amazon States Language, these fields filter and control the flow of JSON from state to state:
- InputPath
- Parameters
- ResultSelector
- ResultPath (can be used to also add information regarding original state input)
- OutputPath (enables you to select a portion of the state output to pass to the next state, if you don't specifiy it defaults to $)

AWS Step Functions applies the `InputPath` field first, and then the `Parameters` field. You can first filter your raw input to a selection you want using `InputPath`, and then apply `Parameters` to manipulate that input further, or add new values. You can then use the `ResultSelector` field to manipulate the state's output before `ResultPath` is applied.
Use `ResultPath` to combine a task result with task input, or to select one of these. The path you provide to `ResultPath` controls what information passes to the output.

**Use ResultPath to:**
- [Replace Input with Result](https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultpath.html#input-output-resultpath-default)
- [Discard Result and Keep Input](https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultpath.html#input-output-resultpath-null)
- [Include Result with Input](https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultpath.html#input-output-resultpath-append)
- [Update a Node in Input with Result](https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultpath.html#input-output-resultpath-amend)
- [Include Error and Input in a Catch](https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultpath.html#input-output-resultpath-catch)
## Standard vs Express Step Functions

- Standard Function
    - Maximum duration: 1 year
    - Exactly-one workflow execution
    - Execution start rate: 2000 per second
    - Price per state transition: more expensive in general
- Express Function
    - Maximum duration: 5 minutes
    - At-least-once workflow execution
    - Execution start rate: 100_000 per second
    - Price per number of execution: much cheaper in general