%dw 2.0
output application/json  skipNullOn="everywhere"
import mapLeafValues from dw::util::Tree

var maskedvalue = "******"
var fieldstomask =p('log.maskInProgressPayloadFields') splitBy(",")

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
inProgress_log:{
	inProgressLog: vars.flowName default '' ++ " flow is in-progress",
	transactionId:correlationId,
	serverName: server.host default '',
	applicationName: p('applicationName') default '',
	flowName:vars.flowName default '',
	environment:p('environment') default '',
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
	serviceResourcePath:vars.reqattributes.requestPath,
	serviceMethod:vars.reqattributes.method,
	queryParameters:vars.reqattributes.queryParams,
	uriParameters:vars.reqattributes.uriParams,
	payload: if(p('log.inProgressPayload') == 'true' and p('log.maskInProgressPayload') == 'true') maskfields(payload) else if(p('log.inProgressPayload') == 'true') payload else ''

}
