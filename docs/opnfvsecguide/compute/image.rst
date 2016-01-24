==============
Image Security
==============
OpenStack Image service (glance) provides discovery, registration, and delivery services for disk and server images. It provides the ability to copy or snapshot a server image, and immediately store it away. Stored images can be used as a template to get new servers up and running quickly and more consistently than installing a server operating system and individually configuring additional services.

In order to prevent a comprised / untrusted VNF from running on the infrastructure, it is important to insure integrity of glance.

Image Signing
~~~~~~~~~~~~~
