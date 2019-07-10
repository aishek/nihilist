## 1.0.0

### Features

- [**BREAKING**] For Ruby on Rails plural method call now return ActiveRecord's model null relation if model with same singular name exists, otherwise return `[]` ([#6](https://github.com/aishek/nihilist/pull/6))
- `respond_to?` now return `true` if method call handled by nigilist ([#6](https://github.com/aishek/nihilist/pull/6))

### Fixes

- [**BREAKING**] Methods with plural name and underscore at the end (for example `monkeys_`) now return `nil` instead of `[]` ([#6](https://github.com/aishek/nihilist/pull/6))
