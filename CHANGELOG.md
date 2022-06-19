## 1.2.4

* `Dictionary.throwOnNilIndex` is now recursive.

## 1.2.3

* New `Dictionary.throwOnNilIndex` method returns a copy of the table that throws an error if a script attempts to access a table value that does not exist.

## 1.2.2

* `List.set` now returns the original list if no mutations are made to it

## 1.2.1

* Fix `reduce` and `reduceRight` to accept a false value as the initial accumulator value ([#2](https://github.com/F-RDY/llama/pull/2))
* `merge` now returns the first dictionary if no mutations are made to it

## 1.0.0

* Initial release
