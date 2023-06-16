# mss-mule-utility-service-cle





**MSS-Utility-Service-CLE**
![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.001.png)






![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.002.png)




![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.002.png)




![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.003.png)





**Date**

**Version - 1.0**
![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.004.png)

**Naresh Vadde**

**Sr Mulesoft Developer**

**Miracle Software Systems, Inc.**

![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.005.png)





Contents 

1.1 Introduction ................................................................................................................................ 

1.2 What is Utility service ................................................................................................................. 

1.3 Setting up the Utility service ....................................................................................................... 

1.4 Using Utility service for error handling ............................................................................................. 

Global Error Handler: .......................................................................................................................... 



















1.1 Introduction 

Application logging and error handling is a critical part of log management and helps smoothly run a business. If you don’t have any proper logging record, it is difficult to identify the events making troubleshooting a long and time consuming process. 

Generally, developers use different logging practices to log the events but in case of a mishap, it is a default to find the required data that is helpful for troubleshooting. This again requires a long process of additional coding or debugging to derive the relevant data. 

To overcome the above scenarios, we have developed a framework Utility Service error handling. This essentially standardizes the message logging and exception handling scenarios in any kind of MuleSoft API. The out-of-box utility service minimizes the developer efforts by 10-15%. 

1.2 What is Utility Service? 

Utility Service is a framework that logs the mule messages with all the required information that would be helpful for troubleshooting. It has the capability to log the mule message in different formats. 

Services offered by Utility Service: 

• It supports different log formats.

• No additional formatting/logging is required and is easily publishable to data aggregation platforms like Splunk, ELK, and others.

• It calculates the latency from start to end across layers, which is useful to monitor the performance of the application. 

• Request level details can be tracked using TransactionID. The TransactionID will be unique for each transaction.

• Additionally, it supports up to 10 context keys to log any other information

• It will propagate the actual error details to the consumer even in the case of API-led approach.

• One can easily configure to log the original and errored payloads.

• Logs the source and target names which are helpful for the support team.

Different formats supported by Utility Service: 

• JSON

• XML

1.3 Setting up the Utility Service 

Using the Runnable Jar: 

\1. Download mss-utility-service-cle jar. 

\2. Include the Utility Service library to maven local repository using the below command. 

**mvn install:install-file -Dfile=\<path>\mss-utility-service-cle.jar -DgroupId=com.co -DartifactId=mss-utility-service-cle -Dversion=1.0.0 -Dpackaging=jar -DgeneratePom=true** 

\3. Add the below dependency to your mule project pom.xml 

`  		`<dependency>

`			`<groupId>com.mss-utilityservice</groupId>

`			`<artifactId>mss-utility-service-cle</artifactId>

`			`<version>1.0.0</version>

`			`<classifier>mule-plugin</classifier>

`		`</dependency>

\4. Import “globalLogger.xml” from the utility service into your project global elements and use the utility service for logging and error handling. 

Code snippet: 

<import doc:name=*"Import"* doc:id=*"1e7228fe-5c6c-4570-9b78-5aa2e688e340"* file=*"globalLogger.xml"* />












1.4 Using Utility Service for Error Handling 

Utility service is simply used by calling the flows defined using Flow Reference. From here, it automatically handles the errors and logs the transaction in the specified format. 

Prerequisite properties to configure: 



Global Error Handler: 

The globalErrorHandler flow logs the error details in case of any errors. This flow works on “On Error Propagate” as well as “On Error Continue”. It logs the error messages in different formats like JSON, XML. 

Steps to configure: 

• Drag and drop ‘On Error Continue’ or ‘On Error Propagate’ based on the requirement.

• Drag and drop the Flow Reference inside the error handling.

• Select the errorLogger as a Flow Name from the drop-down.

• Configure log format and other properties as per requirements.


![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.006.png)

The globalErrorHandler set the actual error status code in the httpStatus variable. The same variable can be used in the HTTP response header to propagate the error status. 


The globalErrorHandler propagates the below error details to the consumer: 

{

`    `"transactionId": "95f2bd20-5627-11ed-892a-b25216072ce7",

`    `"status": "error",

`    `"errorDateTime": "2022-10-27T13:47:59.755-05:00",

`    `"errorType": "MULE:EXPRESSION",

`    `"errorCode": "500",

`    `"errorComponent": "mss-utility-service-cleFlow/processors/4 @ mss-utility-service-cle:mss-utility-service-cle.xml:21 (payload\_Transformation)",

`    `"errorMessage": "\"Unknown content type `application/cd`. Supported content types are: `application/avro`, `application/json`, `application/xml`, `application/csv`, `application/octet-stream`, `text/plain`, `application/x-www-form-urlencoded`, `multipart/form-data`, `text/x-java-properties`, `application/dwb`, `application/xlsx`, `application/flatfile`, `application/java`, `application/dw`, `application/yaml`, `application/x-ndjson`\n\n2| output application/cd\n          ^^^^^^^^^^^^^^\nTrace:\n  at anonymous::main (line: 2, column: 8)\" evaluating expression: \"%dw 2.0\noutput application/cd\n---\n{\n\t\"message\":\" Hello from cle utility service\",\n\t\"name\":payload.name,\n\t\"id\":payload.id,\n\t\"age\":payload.age\n}\"."

}


Sample error log: 

{

`    `"error\_log": {

`        `"errorLog": "mss-test-app flow has errors",

`        `"transactionId": "ab36e2b0-5640-11ed-8ac2-b25216072ce7",

`        `"serverName": "WELCOME.mshome.net",

`        `"applicationName": "mss-test-app",

`        `"flowName": "mss-test-app",

`        `"environment": "dev",

`        `"executionState": "Error",

`        `"serviceResourcePath": "/test",

`        `"serviceMethod": "GET",

`        `"queryParameters": {},

`        `"uriParameters": {},

`        `"payload": {

`            `"name": "Naresh",

`            `"id": "\*\*\*\*\*\*",

`            `"age": "\*\*\*\*\*\*"

`        `},

`        `"timeStamp": "2022-10-27T16:46:18.188-05:00",

`        `"logLevel": "Error",

`        `"errorCode": "500",

`        `"errorType": "MULE:EXPRESSION",

`        `"errorComponent": "mss-test-appFlow/processors/4 @ mss-test-app:mss-test-app.xml:19 (Transform Message)",

`        `"errorMessage": "",

`        `"errorDescription": "\"Unknown content type `application/dc`. Supported content types are: `application/avro`, `application/json`, `application/xml`, `application/csv`, `application/octet-stream`, `text/plain`, `application/x-www-form-urlencoded`, `multipart/form-data`, `text/x-java-properties`, `application/dwb`, `application/xlsx`, `application/flatfile`, `application/java`, `application/dw`, `application/yaml`, `application/x-ndjson`\n\n2| output application/dc\n          ^^^^^^^^^^^^^^\nTrace:\n  at anonymous::main (line: 2, column: 8)\" evaluating expression: \"%dw 2.0\noutput application/dc\n---\npayload\"."

`    `}

}


Sample end to end success log:

{

`    `"start\_log": {

`        `"startLog": "mss-test-app flow has started",

`        `"transactionId": "735947c0-5640-11ed-8ac2-b25216072ce7",

`        `"serverName": "WELCOME.mshome.net",

`        `"applicationName": "mss-test-app",

`        `"flowName": "mss-test-app",

`        `"environment": "dev",

`        `"timeStamp": "2022-10-27T16:44:01.048-05:00",

`        `"serviceResourcePath": "/test",

`        `"serviceMethod": "GET",

`        `"queryParameters": {},

`        `"uriParameters": {},

`        `"payload": {

`            `"name": "Naresh",

`            `"id": "\*\*\*\*\*\*",

`            `"age": "\*\*\*\*\*\*"

`        `}

`    `}

}



{

`    `"inProgress\_log": {

`        `"inProgressLog": "mss-test-app flow is in-progress",

`        `"transactionId": "735947c0-5640-11ed-8ac2-b25216072ce7",

`        `"serverName": "WELCOME.mshome.net",

`        `"applicationName": "mss-test-app",

`        `"flowName": "mss-test-app",

`        `"environment": "dev",

`        `"timeStamp": "2022-10-27T16:44:15.816-05:00",

`        `"serviceResourcePath": "/test",

`        `"serviceMethod": "GET",

`        `"queryParameters": {},

`        `"uriParameters": {},

`        `"payload": {

`            `"name": "Naresh",

`            `"id": "\*\*\*\*\*\*",

`            `"age": "\*\*\*\*\*\*"

`        `}

`    `}

}




{

`    `"end\_log": {

`        `"endLog": "mss-test-app flow has ended",

`        `"transactionId": "735947c0-5640-11ed-8ac2-b25216072ce7",

`        `"serverName": "WELCOME.mshome.net",

`        `"applicationName": "mss-test-app",

`        `"flowName": "mss-test-app",

`        `"environment": "dev",

`        `"timeStamp": "2022-10-27T16:44:20.596-05:00",

`        `"requestProcessTime": "19.52S",

`        `"serviceResourcePath": "/test",

`        `"serviceMethod": "GET",

`        `"queryParameters": {},

`        `"uriParameters": {},

`        `"payload": {

`            `"name": "Naresh",

`            `"id": "\*\*\*\*\*\*",

`            `"age": "\*\*\*\*\*\*"

`        `}

`    `}

}


**© 2022 Miracle Software Systems, Inc.**

**www.miraclesoft.com**
![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.007.png)![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.008.png)![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.009.png)![](Aspose.Words.0efd08b8-3f5c-4d8f-8392-3883cb5feb83.010.png)
