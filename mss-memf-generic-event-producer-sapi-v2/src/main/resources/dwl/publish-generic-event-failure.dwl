%dw 2.0
output application/xml

---
GenericEvent:{
	EventCategory : 'info',
	EventDescription : 'Failed',
	EVENT_CODE: '-1',
	Severity : 'INFO',
	
	
	EnvironmentDetails : 
	{
		SYSTEM_INFO :
		{
		Env: 'dev',
		ServerInstance :'123.33.1.67',
		MuleVersion :attributes.version,
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
	 AppName:'meaf_sap',
     timestamp : vars.time,
	 flowName : flow.name,
	 status: vars.httpStatus,
	 description: error.description
	 }