# Contributing

## Making a Release

Git release tags are the single source of truth for release
numbers and release triggers. There is no version information in the
pom file. A default version number is contained in
`.mvn/maven.config`, which should be kept up to date. However, it is
overridden in the CI/CD pipelines by the release tag.

Releases of installable packages will be created with github actions
on tags with a name matching the pattern
`[0-9]+\.[0-9]+\.[0-9]+(-.*)?`,
i.e. `<MAJOR>.<MINOR>.<BUGFIX>[-<SUFFIX>]`. But only tags matching the
pattern `[0-9]+\.[0-9]+\.[0-9]+` will result in an update of the
descriptor file.--So, releases with a suffix are considered kind of
beta and will only occur in the tag's release bundle.

To produce a release:

- first push the branch to be released
- then tag it with the tag name matching the above pattern

This will produce a release on [releases/tag/<TAG_NAME>](releases/tag)
and update the [descriptor
file](https://scdh.github.io/oxbytei/descriptor.xml).

The pattern for release tags is protected.
