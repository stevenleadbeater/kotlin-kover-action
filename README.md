# GitHub Action for running coverage tests for kotlin projects using gradle and the Kover plugin

Run coverage tests, add the result to a PR as a comment and receive the results as output

##Usage
make sure you only add this for `pull_request` targets, the bot needs somewhere to put its comments
```yaml
name: Test coverage

on:
  pull_request:

jobs:

  collect_coverage:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: stevenleadbeater/kotlin-kover-action@v1.0.0
        id: kover-tests
        with:
          coverage-threshold: 80
          repo-token: ${{ secrets.GITHUB_TOKEN }}
      - name: Check coverage
        if: ${{(steps.kover-tests.outputs.line-coverage) < 80}}
        shell: bash
        run: exit "Line coverage expected to be > 80 but was ${{steps.kover-tests.outputs.line-coverage}}"
```

An example comment the bot puts on the PR:

| Area  | Coverage(%) | Status |
| ------------- | ------------- | ------------- |
| **Line**  | 95  | :heavy_check_mark: |
| **Instruction**  | 85  | :heavy_check_mark:  |
| **Branch**  | 66  | :x:  |
| **Method**  | 89  | :heavy_check_mark:  |
| **Class**  | 89  | :heavy_check_mark:  |

## Inputs

### `coverage-threshold`:
**Optional** - (default 80) -  The lower limit percentage of coverage for emoticons in the comment

## Outputs

### `line-coverage`:
Percentage coverage of lines in files

### `instruction-coverage`:
Percentage coverage of instructions

### `branch-coverage`:
Percentage coverage of logic branches

### `method-coverage`:
Percentage coverage of methods

### `class-coverage`:
Percentage coverage of classes

## License

The action and documentation in this project are released under the [MIT License](LICENSE-MIT.txt).

