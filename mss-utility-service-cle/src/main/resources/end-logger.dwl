%dw 2.0
output application/json  skipNullOn="everywhere"
import * from dw::core::Strings
import mapLeafValues from dw::util::Tree

var a= (now() - vars.startlog.start_log.timeStamp default now())
var maskedvalue = "******"
var fieldstomask =p('log.maskResponsePayloadFields') splitBy(",")

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
end_log:{
	endLog: vars.flowName default '' ++ " flow has ended",
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
	requestProcessTime: substring(a, 2, 15),
	serviceResourcePath:vars.reqattributes.requestPath,
	serviceMethod:vars.reqattributes.method,
	queryParameters:vars.reqattributes.queryParams,
	uriParameters:vars.reqattributes.uriParams,
	payload: if(p('log.responsePayload') == 'true' and p('log.maskResponsePayload') == 'true') maskfields(payload) else if(p('log.responsePayload') == 'true') payload else ''
}
