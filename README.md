**blackboard.rest**

*A library for Blackboard's REST API, written in Dart.*

The interfaces for this API reflects that of Blackboard's REST API, and as such
the documentation to follow is found here:

https://developer.blackboard.com/portal/displayApi/Learn?version=3400.1.0

Currently the Blackboard Learn version supported is version 3400.1.0 (Q2 2018, CU1).
Also, in terms of the CRUD operations, there is no support for deletions.  This
may or may not change in the future.

It will be helpful to have previous experience with the workflow of using
Blackboard's REST API, but not particularly necessary.  The workflow is fairly
straightforward:

1. Obtain a developer secret and key, and establish application availability on
   a Learn server.

2. The security context working with Blackboard's API can be done with at the
   application level (2-legged OAuth) or the user level (3-legged OAuth).
   2a. If at the application level, a specific Learn user must still be
       associated with the application, for which access to the various
       endpoints will be done based on the entitlements for that user.
   2b. If at the user level, an authorization code (using the oauth2 API) must
       be obtained first.  This requires the user to manually log into
       Blackboard and authorize your application (this cannot be done
       programmatically).  Users of this API will require both client and server
       code to handle the process.

3. Whether using the application level, or obtaining an authorization code, an
   OAuth2 token must be obtained that will be used for all subsequent calls.

4. Using the token, invoke various API calls as needed.

Note that, as is typical for REST API's, there is a limit on the number of calls
that can be made in a single 24 hour period.

**Example workflow:**

Assume that an application (with key/secret) has been established with a Learn
server.
