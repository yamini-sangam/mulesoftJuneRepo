%dw 2.0
import dw::Runtime
output application/xml

---
GenericEvent:{
	EventCategory : 'info',
	EventDescription : 'Success',
	EVENT_CODE: payload.eventCode,
	Severity : 'INFO',
	
	
	EnvironmentDetails : 
	{
		SYSTEM_INFO :
		{
		Env: p('environment'),
		ServerInstance :'123.33.1.67',
		MuleVersion : attributes.version,
		AnypointStudio :'V7.15'
			
	}},
		PayloadHeader :{
			Orginalpayload : attributes.relativePath ,
			//(path :inboundProperties.'http.query.params'.HttpPath),
			pheader :{
		PayloadType :'JSON'
		//CORRELATION_ID : flowVars.Message_id
				
	} },
	  
	 TRACKING_ID: uuid(),
		
     SourceQueue :'MEMF',
	 ComponentType :'Mulesoft',
//	 ComponentName : flow.name,
	 AppName:p('applicationName') default '',
    timestamp : vars.time,
	 flowName : flow.name,
	 status: vars.httpStatus,
	 description: vars.description
	 }