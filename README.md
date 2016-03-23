# Conlog

Is really for the control freak in all of use. It is just simple logging and configuration management.

### Opinions

I say simple but it really opinionated, so it for everyone, you have my permission to hate it.

#### Logging


1. When you are coding it is context jump, all be it a small one to write a consistent coherent log message.
2. Do not make the the jump, pick from an enumerated list, about what the log message is and complete some named arguments.
3. The log so that can of the rest making things consistent.
4. You should not think about the log level, depending on the context and how you running your app (Develop, Diagnose or Deploy) logger should work it out for you.
5. Should be able to log as much as you want with working about introducing overhead.
6. Log message should be group by context and execution tread/environment, but I should not have toi do this. Again the logger should.
7. I want ot understand everything about the codes execution, especially async code. Logger also needs to group this together for me.

#### Configuration


1. I hate strings in you code. Make feeling like I can call it done.
2. I hate magic Numbers.
3. I like being about clear reasoning about behaviour based on configuration, I hate If statements.
4. I want to pay for my configuration at complied time. I would rather have a couple of sets of configuration value control by one case statement then an If running flow control.
5. Configuration is immutable in every way there is no need more then a need to use it.
6. I would rather have function that produces a '-' dash then actually type it in my code.
7. Use Enums they provide very light weight structure.

Those are the reasons this package exist. I know in many ways it may some trivial and totally over engineered, especially because it is async and not performance blocking. 
But it is area that is so well defined and there should not be any doubt about how it works.

**_Above all I hate confession over a log entry or configuration parameter name._**