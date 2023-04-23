# Debrepo

A Debian repository management tool.

## Development
__Warning! This software is still under development and is not intended for stable use.__

### Todo
- [x] finish add feature
- [x] create del feature
- [ ] multiple repositories feature
- [ ] signing repositories using GPG
- [ ] make simple way to edit repository info in release file

## About
`Debrepo` is a software tool designed for creating and managing Debian repositories for `*.deb` packages, providing a lightweight and user-friendly alternative to more complex tools like `reprepo` or `aptly`. While these alternatives may offer more advanced features, Debrepo focuses on providing essential functionality and ease of use for repository management, allowing users to easily add, remove, and update packages within their repositories. With Debrepo, users can efficiently manage their Debian repositories without the unnecessary complexity of more advanced tools.

## Dependencies
`sh` `dpkg` `gpg` `python3`

## Installation
### from deb package
- Todo

### from source
- Todo

## How to use
```
USAGE:
	debrepo [OPTIONS] [DEB]

OPTIONS:
	init, -i, --init
		create repository folder structure
	add, -a, --add
		add deb package to repository
	del, -d, --del
		delete deb package from repository
	serve, -s, --serve
		serve repository using python built in http module
	help, -h, --help
		print help message
	-v, --version
		print version of debrepo package

ARGS:
	<DEB>...
		*.deb package to add or delete from repository.
```

## License
Debrepo is a software tool that is licensed under the MIT license. This means that users are free to use, copy, modify, and distribute the tool, both in source code and binary form, as long as they include the original copyright and license notice in any copies or modified versions of the software. The MIT license also comes with no warranty or liability, meaning that the author or contributors of the software cannot be held responsible for any damages or issues that may arise from the use of the software.

