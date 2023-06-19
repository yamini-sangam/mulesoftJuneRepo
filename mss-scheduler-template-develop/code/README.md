# Poll Template for Mule 4

Poll Templates act as foundations for developers to start building Polling based applications. They need not worry about adding dependencies and is handled by the template. The template utilizes 2 Mule Extensions as follows,

1. JSON Logger: This is used for Logging in the API and is custom plugin. We need to publish this to your private Exchange before publishing the template.
2. Error Handler Plugin: This is a common error handler that is fully customizable and is used by the template to handle errors. In case of an error the On Error Propgate is used which sends the information to the error handler which then handles the error, maps to the error object and prints it. You need to publish this to Exchange before using the template.

## Template Features

1. Logging - Uses the JSON Logger to take care of logging
2. Error Handling library- Uses the Error Handler Library to conduct error handling.
3. End to End Transaction Handling


## Usage

Also view the readme.txt file that explains how to use template
