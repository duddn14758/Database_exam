<?xml version="1.0" encoding="UTF-8" ?>
<jsp:directive.page contentType="text/xml"/>
<website>
<jsp:declaration>
private int callCount = 0;
private void increaseCallCount()
{
this.callCount++;
}
</jsp:declaration>
<jsp:scriptlet>
int CALL_COUNT=0;
increaseCallCount();
CALL_COUNT++;
</jsp:scriptlet>
<path>
<jsp:expression> request.getRequestURI() </jsp:expression>
</path>
<callcount>
<jsp:expression> callCount </jsp:expression>
<jsp:expression> CALL_COUNT </jsp:expression>

</callcount>
</website>