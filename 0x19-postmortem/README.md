0x19-postmortem

Server Outage Incident report

By Ian Muhwanga, CasualCartoon

16 th January 2024, we experienced a server outage on all our server infrastructure which led to our clients not able to use our services and we apologize for the loss incurred by our clients in terms of capital within this time.

Issue Summary

On 16 th January 2024 (10am GMT + 1), were experienced a server issue on all our server infrastructure, on the 37 th minute of exploration.Consequentially, our clients were exposed to an http 500 error that had a 100% impact on their business. Their inability to access our services led to this unprecedented event that transpired due to not testing out all implemented upgrades before pushing to production servers. The table below outlines the events with its respective timestamps at GMT + 1, starting from when the first action was initiated.
Time (GMT + 1)	Actions
9:45 AM	Upgrades implementation begins
10:00AM	Server Outage begins
10:00AM	Pagers alerted on-call team
10:10AM	On-call team acknowledgement
10:15AM	Rollback initiation begins
10:20AM	Successful rollback
10:20AM	Server restart initiated
10:22AM	100% of traffic back online

Root Cause: (RC)

On the 5 th of September 2020 around 9:45 am (GMT + 1) we initiated a server uptrend affecting all our production sever cluster; some of the files that had been shipped to the production server clusters by the CI/CD pipeline required an authentication based on a 3 rd party software. The new features thus implemented are developed from 3 rd parties software which is yet to be supported by the version of the software installed in our servers thus resulting in complete downtime since the database transactions could not be authenticated between the server-side and the database lock, we however, swiftly sorted this our by rolling back to our previous state the evening of the same day on 8:30 pm and then upgraded our system version protecting the next day.

Preventive measures

Pushing all intended changes 1st to our test environments before shipping to life server.

Increase the performance metrics threshold to alert on-call engineers on the event of possible server crash
