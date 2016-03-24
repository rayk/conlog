library logTypes;

/// Represents the subject, the Who or What of the situation. This is entity that
/// has control of the thread or unit of concurrency at the point in time. Keep abstracting
/// until you find the top level then work your way back down.
enum Subject{
  Class, // The subject being an actual class or a constant aof the class.
  Closure, // A particular function that has is return containing state information.
  DomainProcess, // An operation defined as relating to the domain.
  Function, // A particular function in the application.
  Object, // Simply a particular identifiable instance of class.
  OsEntity, //File or directory artifact of a locally or remotely.
  Service, // Provider with a defined API locally or remotely.
  TechnicalProcess, // Implementation to transform, translate, serialise etc.
}

/// Represents the verb, the action of what is happening, happened or about to happen. You will notice
/// the matching pairs here. Using will result in group on the logs.
/// Sometime it can hard to work out when to use started, call and request. The differentiators of all of
/// comes down to two factors, returns and expected time.
///
/// Making an Async call with the expectation of a return within the next few cycles of the executing loop is the
/// near future. Making an Async call with the possibility of needing to make more calls any of which may not
/// complete for a dozen cycles or more is a said to be starting something.
///
/// Call is to void function of method, using Called to representing when control returns to the subject that made the call.
enum Act{
  Aggregate, // Pre commencement of bring data from number of sources into one.
  Aggregated, // The aggregation of data from various sources id completed.
  Aggregating, // The Future is in hand for the aggregation, it may not have commenced yet.
  Call, // About to make a void call, no return is expected.
  Called, // a blocking void return call has completed.
  Canonicalise, // Pre commencement of standardising the representation of some data.
  Canonicalised, // Data in an alternative format has be standardised.
  Canonicalising, // The Future is in hand for the standardising the representation of some data.
  Construct, // Before an constructor on an object.
  Constructed, // Object constructed and back in the hands of the requester or it's proxy.
  Establish, // About to commence to creating something that is intend to last the session, a connection, service, etc.
  Established, // The entity, connection, service, etc is established and operational.
  Establishing, // During the process of create this season wide entity.
  Finished, // The last line of the subject as been executed.
  Finishing, // The last line of code for the task has executed, yet micro task are scheduled.
  Fold, // Pre commencement of a folding operation.
  Folded, // Completion of a folding operations.
  Heard, // As a result of listening to a stream and receiving an event.
  Listen, // In regards to a stream this indicates the point in time you have the stream have yet called listen on it but you do intend to do so.
  Map, // Pre commencement of a abstracting into map operations.
  Mapped, // Completion of a abstracting into map operation.
  Match, // Pre commencement of a Match Operation.
  Matched, // Completion of a Matching Operating.
  Partition, // Pre commencement of a creating two list that matches and does not match a predicated.
  Partitioned, // Completed create two list one that matched the predicate and the other that did not
  Received, // Something was received as part of a request.
  Reduced, // Completion of a reduction operation/
  Reduction, // Pre commencement of a reduction operation.
  Request, // For a blocking call to a method or function where there is an expectation of a return.
  Requesting, // The first line has executed of call when the return is expected in the near future.
  Retired, // The outcome of a retry is known.
  Retry, // The intend to retry an action believe it will work or correct.
  Retrying, // The future is in hand for the retry but code has be executed.
  Started, // The first line of code of the subject has been executed.
  Starting, // The first line has not executed but a future has just been scheduled. Where completion is not expected in execution loop cycle.
  StateChanged, // A particular state on the subject changed.
  Validate, // Pre commencement of a action to use the subject to interaction with another dynamic subject to determine it's correctness or validity.
  Validated, // Interaction has taken place to with another subject to determine this subjects validity.
  Validating, // The future is in hand for but the interaction has not commenced to determine the subjects validity.
  Verified, // Action has been completed that checked the subject is compliant to a static criteria.
  Verify, // Pre commencement of the action to ensure the subject is compliant to a static criteria.
  Verifying, // The future is in hand for a checking that the subject is compliant to a static criteria.
  Zip, // Pre commencement of zipping of a list into pair wise elements.
  Zipped, // Completion of a pair wise elements list zipping operation.

}

enum DirectObject{
  DomainObject, //
  Error, // Terminating error caused by an code action.
  Exception, // Non terminating error returned as result of an action.
  List, // List
  Map, // Map
  Set, // Set
  Tuple, // A Tuple type.
}