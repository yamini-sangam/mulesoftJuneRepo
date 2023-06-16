%dw 2.0
output application/json
---
{
	app_name : payload.GenericEvent.AppName,
	comp_name : payload.GenericEvent.flowName,
	severity: payload.GenericEvent.Severity,
	event_category: payload.GenericEvent.EventCategory,
	event_code : payload.GenericEvent.EVENT_CODE,
	system_info: payload.GenericEvent.EnvironmentDetails.SYSTEM_INFO.AnypointStudio,
	server_instance: payload.GenericEvent.EnvironmentDetails.SYSTEM_INFO.ServerInstance,
	payload_header: payload.GenericEvent.PayloadHeader.Orginalpayload,
	payload_body: payload.GenericEvent.PayloadHeader.pheader.PayloadType,
	trackingId: payload.GenericEvent.TRACKING_ID,
	event_description:payload.GenericEvent.EventDescription,
	created_ts : payload.GenericEvent.timestamp,
	status: payload.GenericEvent.status,
	comment: payload.GenericEvent.description
	
	
}