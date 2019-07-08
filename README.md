# Cacofonix

Cacofonix helps you work with ONIX data in your Ruby applications. ONIX is a set
of (XML-based) standards for published products. Cacofonix focuses on the _[ONIX
for Books][onix_standard]_ standard, and currently supports ONIX 2.1 (all
revisions).

With Cacofonix, you can:

- Efficiently read ONIX files
- Map records in ONIX files to Ruby objects
- Write ONIX files

Cacofonix is an updated, maintained fork of James Healy's original [onix
gem][onix_gem_original], also incorporating Joseph Pearson's [major
refactorings][onix_gem_joseph] and expanded support for the standard.

[onix_standard]: https://www.editeur.org/11/Books/
[onix_gem_original]: https://github.com/yob/onix
[onix_gem_joseph]: https://github.com/yob/onix/pull/3

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem "cacofonix"
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install cacofonix
```

## Usage

See the files in the [examples/][examples] directory to get started quickly.

For more detail, view the comments in the following classes:

* [`Cacofonix::Reader`][reader] - For reading ONIX files
* [`Cacofonix::Writer`][writer] - For writing ONIX files
* [`Cacofonix::Normaliser`][normaliser] - For normalising ONIX files before
  reading (Fixes encoding issues, etc.)
* [`Cacofonix::Lists`][lists] - For building hashes of code lists from the ONIX
  spec

[examples]: examples
[reader]: lib/cacofonix/core/reader.rb
[writer]: lib/cacofonix/core/writer.rb
[normaliser]: lib/cacofonix/utils/normaliser.rb
[lists]: lib/cacofonix/core/lists.rb

## ONIX support

`Cacofonix::Reader` only handles the reference tag versions of ONIX 2.1. Use
`Cacofonix::Normaliser` to convert any short tag files to reference tags.

`Cacofonix::Writer` only generates reference tag ONIX files.

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cacofonix codebase, issue trackers, chat rooms and
mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).
