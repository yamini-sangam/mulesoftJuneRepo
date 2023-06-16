%dw 2.0
output application/json skipNullOn="everywhere"
---
{
	transactionId: correlationId,
	status: "error",
	errorDateTime: now(),
	errorType: (error.errorType.namespace) ++ (":") ++(error.errorType.identifier),
	errorCode: vars.errorCode default 500,
	errorComponent:error.failingComponent,
	errorMessage:error.description
		
}