# Conlog

For the control freak in all of us. It is just simple logging and configuration management.

### Opinionated

I say simple but it really opinionated, so it is not for everyone, you have my permission to hate it.

#### Logging

- When you are coding it is context jump, all be it a small one to write a consistent coherent log message.
- Do not make the the jump, pick from an enumerated list, about what the log message is and complete some named arguments.
- The log so that can of the rest making things consistent.
- You should not think about the log level, depending on the context and how you running your app (Develop, Diagnose or Deploy) logger should work it out for you.
- Should be able to log as much as you want with working about introducing overhead.
- Log message should be group by context and execution tread/environment, but I should not have toi do this. Again the logger should.
- I want ot understand everything about the codes execution, especially async code. Logger also needs to group this together for me.

#### Configuration

- I hate strings literals in code. Make feeling like I can not call it done.
- I hate magic Numbers.
- I like being about clear reasoning about behaviour based on configuration, I hate If statements.
- I want to pay for my configuration at complied time. I would rather have a couple of sets of configuration values that need to be picked from, then ```If``` statements running flow control.
- Configuration attributes are immutable in every way there is no need for it ever to change are runtime.
- I would rather have function that produces a '-' dash then actually type it in my code, as a literal.
- I hate config parameters that does not have quick IDE documentation access.

Those are the reasons this package exist. I know in many ways these things are trivial, but I just take it anymore.
The solution is probably over engineered. Logging is async with it's own heap space, the configuration sets support tree shaking.
I just don't want to come back to this area again.

:rage: **_Above all.. I hate log entries that lie, especially when I made up the lie myself or having to accept an overly long parameter names._** :rage: