%dw 2.0
output application/json skipNullOn="everywhere"

import mapLeafValues from dw::util::Tree

var maskedvalue = "******"
var fieldstomask =p('log.maskErroredPayloadFields') splitBy(",")

fun maskfields(data) =(
data mapLeafValues ((value, path) -> 
if(
 (fieldstomask contains value.@name)
or (fieldstomask contains path[-1].selector)
)maskedvalue
else value
)
)

---
error_log:{
	errorLog: vars.flowName default '' ++ " flow has errors",
	transactionId:correlationId,
    serverName: server.host default '',
    applicationName: p('applicationName') default '',
    flowName:vars.flowName default '',
    environment:p('environment'),
    executionState: "Error",
    serviceResourcePath: vars.reqattributes.requestPath,
    serviceMethod: vars.reqattributes.method,
    queryParameters:vars.reqattributes.queryParams,
	uriParameters:vars.reqattributes.uriParams,
    payload: if(p('log.erroredPayload') == 'true' and p('log.maskErroredPayload') == 'true') maskfields(payload) else if(p('log.erroredPayload') == 'true') payload else '',
    timeStamp: now(),
	contextKey1: "test",
	contextKey2: null,
	contextKey3: null,
	contextKey4: null,
	contextKey5: null,
	contextKey6: null,
	contextKey7: null,
	contextKey8: null,
	contextKey9: null,
	contextKey10: null,
    logLevel: "Error",
    errorCode: vars.errorCode default 500,
    errorType: (error.errorType.namespace) ++ (":") ++(error.errorType.identifier) default '',
    errorComponent:error.failingComponent default '',
    errorMessage:error.errorMessage default null,
    errorDescription:error.description default '',
    
    
}