========
Keystone
========
Authentication is an integral part of any real world OpenStack
deployment and so careful thought should be given to this aspect of
system design. A complete treatment of this topic is beyond the scope of
this guide however some key topics are presented in the following
sections.

At its most basic, authentication is the process of confirming identity
- that a user is actually who they claim to be. A familiar example is
providing a username and password when logging in to a system.

The OpenStack Identity service (keystone) supports multiple methods of
authentication, including user name & password, LDAP, and external
authentication methods. Upon successful authentication, The Identity
service provides the user with an authorization token used for
subsequent service requests.

Transport Layer Security (TLS) provides authentication between services
and persons using X.509 certificates. Although the default mode for TLS
is server-side only authentication, certificates may also be used for
client authentication.


Keystone Audit
~~~~~~~~~~~~~~

Authentication is an integral part of any real world OpenStack
deployment and so careful thought should be given to this aspect of
system design. A complete treatment of this topic is beyond the scope of
this guide however some key topics are presented in the following
sections.

At its most basic, authentication is the process of confirming identity
- that a user is actually who they claim to be. A familiar example is
providing a username and password when logging in to a system.

The OpenStack Identity service (keystone) supports multiple methods of
authentication, including user name & password, LDAP, and external
authentication methods. Upon successful authentication, The Identity
service provides the user with an authorization token used for
subsequent service requests.

Transport Layer Security (TLS) provides authentication between services
and persons using X.509 certificates. Although the default mode for TLS
is server-side only authentication, certificates may also be used for
client authentication.
