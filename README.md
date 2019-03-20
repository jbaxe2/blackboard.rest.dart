**blackboard.rest**

*A library for Blackboard's REST API, written in Dart.*

The interfaces for this API reflects that of Blackboard's REST API, and as such
the documentation to follow is found here:

https://developer.blackboard.com/portal/displayApi/Learn?version=3400.1.0

Currently the Blackboard Learn version supported is version 3400.1.0 (Q2 2018, CU1).

Also, in terms of the CRUD operations, there is no support for deletions.  This
may or may not change in the future.

Starting out, this implementation will only support core functionality of the
Blackboard REST API.  The optional functionality (such as optional parameters
for the DTO's and endpoints) will come later, once the library has matured.

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
       programmatically).  Users of this API will only work with the server
       code to handle the process.

3. Whether using the application level, or obtaining an authorization code, an
   OAuth2 token must be obtained that will be used for all subsequent calls.

4. Using the token, invoke various API calls as needed.

Note that, as is typical for REST API's, there is a limit on the number of calls
that can be made in a single 24 hour period.


**Example workflow:**

Assume that an application (with key/secret) has been established with a Learn
server.

Create a Blackboard REST OAuth2 instance that will be used to obtain a token
for service requests:

*BlackboardRestOAuth2 oauth2 = getOAuth2Instance (
  Uri.parse ('host'), 'clientId', 'secret'
);*

If obtaining an authorization code:

*oauth2.getAuthorizationCode (redirect_uri, 'code', httpResponse)*

The redirect_uri is an instance of [Uri] that the user will be redirected to once
the application permissions have been allowed.  This could be the same URI as the
client application, or somewhere else.  The httpResponse should be the
[HttpResponse] instance for which the redirect of the client may be triggered.

Next we'll need to request the token:

*AccessToken token = await oauth2.requestToken ('client_credentials')*

OR (if we received an authorization code to act on behalf of a specific user)

*AccessToken token = await oauth2.requestToken (
  'authorization_code', 'the_auth_code'
)*

In this case, 'client_credentials' is used when acting on behalf of an
application, and 'authorization_code' is used when we have received a code by
a specific user allowing the application to act on his or her behalf.

Note that if using an authorization code, this must be handled in two *separate*
requests.  The first request redirects the user to obtain the authorization code.
The second request makes use of the authorization code (so it must be passed in
by the client application on the second request).  When acting on behalf of an
application, there is no need to request authorization.

Further examples can be found in the example folder.


**A Note on Tests...**

It should be noted that due to the nature of this library (i.e., working with a
remote API), most of the tests are integration tests, although unit tests will
be deployed where appropriate (for example, DTO factories).

Since several of the tests are integration tests, some of the data used for
testing deals with the information of the developer's instance (such as course
ID's).  These would need to be replaced when testing for someone else's instance.

Running the integration tests will count against the rate limit.
