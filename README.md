AQSActionEmailActivity
======================

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
NSArray *activityItems = @[[AQSEmailActivityTitle titleWithTitle:@"Title!"], @"Body!"];
```

And to set recipients, include `AQSEmailActivityRecipient` objects in `activityItems`.

```objc 
NSArray *activityItems = @[[AQSEmailActivityRecipient recipientWithEmailAddress:@"some@example.com"]];
```

To set CC or BCC recipients, just specify recipient's type.

```objc
NSArray *activityItems = @[[AQSEmailActivityRecipient recipientWithEmailAddress:@"some@example.com" withType:AQSEmailActivityTypeCC]];
```

Installation
---

```
pod "AQSActionEmailActivity"
```

Related Projects
---

- [AQSShareService](https://github.com/AquaSupport/AQSShareService) - UX-improved sharing feature in few line. 