TEMPLATE NOTES
==============

The following template needs to be used as follows:

1. Rename the below according to MET Naming standards
	- Mule Project "poll-template"
	- pom.xml:
		- <artifactId>poll-template-v1</artifactId> with your project name
		- <name>Poll Based Applications Template</name> with the "<YOUR_DISPLAY_API_NAME>"

2. In the config-<environment>.yaml update the value of polling.frequency, api.name and api.verison.

3. The implementation should happen on a separate configuration file (e.g. implementation.xml).

4. If testing locally (Anypoint Studio) you need to pass the securedKey, env as a JVM argument (e.g. -DsecuredKey=somekey, -Denv=dev)


SETUP SECURE PROPERTIES
=======================

Install from Exchange and use

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     