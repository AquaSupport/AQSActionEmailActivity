AQSActionEmailActivity
======================

![](http://img.shields.io/cocoapods/v/AQSActionEmailActivity.svg?style=flat) [![Build Status](https://travis-ci.org/AquaSupport/AQSActionEmailActivity.svg?branch=master)](https://travis-ci.org/AquaSupport/AQSActionEmailActivity) 

[iOS] `UIActivity` class for Email that appears in Action category in `UIActivityViewController`

```

Usage
---

```objc
UIActivity *emailActivity = [[AQSActionEmailActivity alloc] init];

UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:emailActivity];
activityViewController.excludedActivityTypes = @[UIActivityTypeMail];

[self presentViewController:activityViewController animated:YES completion:NULL];
```

Advanced Usage
---

To set a title, include `AQSEmailActivityTitle` objects in `activityItems`.

```objc
NSArray *activityItems = @[
	[AQSEmailActivityTitle titleWithTitle:@"Title!"],
	@"Body!"
];
```

And to set recipients, include `AQSEmailActivityRecipient` objects in `activityItems`.

```objc 
NSArray *activityItems = @[
	[AQSEmailActivityRecipient recipientWithEmailAddress:@"some@example.com"]
];
```

To set CC or BCC recipients, just specify recipient's type.

```objc
NSArray *activityItems = @[
	[AQSEmailActivityRecipient recipientWithEmailAddress:@"some@example.com" withType:AQSEmailActivityTypeCC]
];
```

Combile all of them, you can represent an email whose title is `Title`, body is `Body`, to is `example@example.com` as follows.

```objc
NSArray *activityItems = @[
	[AQSEmailActivityTitle titleWithTitle:@"Title"],
	[AQSEmailActivityRecipient recipientWithEmailAddress:@"example@example.com"],
	@"Body"
];
```

Installation
---

```
pod "AQSActionEmailActivity"
```

Link to Documents
---

https://dl.dropboxusercontent.com/u/7817937/___doc___AQSActionEmailActivity/html/index.html

Related Projects
---

- [AQSShareService](https://github.com/AquaSupport/AQSShareService) - UX-improved sharing feature in few line. 
