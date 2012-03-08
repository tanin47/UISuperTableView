UISuperTableView
==========================

This is a subclass of UITableView.

It offers:

* A blank page with a message telling users that there is no rows. By the way, you can customize the message.
* A loading icon at the very beginning.

![Loading](https://github.com/tanin47/UISuperTableView/raw/master/loading.png)

![Empty](https://github.com/tanin47/UISuperTableView/raw/master/no_data.png)

![Normal](https://github.com/tanin47/UISuperTableView/raw/master/normal.png)


*It only works with 1-section UITableView*


How to use it
---------------------------

Use it like a normal UITableView.


### No-row label customization

To customize the no-rows message:

```objc
self.tableView.emptyLabelText = @"No Data";
```

You can even use your own label by setting emptyLabel property:

```objc
self.tableView.emptyLabel = [[UILabel alloc] init];
self.tableView.emptyLabel.textAlignment = UITextAlignmentCenter;
self.tableView.emptyLabel.backgroundColor = [UIColor yellowColor];
```


### Control the loading icon

To show the loading icon, you can invoke:

```objc
[self.tableView startLoading];
```

and, to hide the loading icon and show the table, you can invoke:

```objc
[self.tableView stopLoading];
```

You can also use your own UIActivityIndicatorView by setting loadingIcon property:

```objc
self.tableView.loadingIcon = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
```

Author
------------------------
Tanin Na Nakorn

License
------------------------
This project is under Tanin License, which means:

1. You can use it under a free/commercial/whatever project
2. You can do whatever you want with it
3. You can steal it and declare that you build it.

There is no need to give the owner credit.