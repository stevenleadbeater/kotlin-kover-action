# GitHub Action for running coverage tests for kotlin projects using gradle and the Kover plugin

Run coverage tests, add the result to a PR as a comment and receive the results as output

| Area  | Coverage(%) | Status |
| ------------- | ------------- | ------------- |
| **Line**  | 95  | :heavy_check_mark: |
| **Instruction**  | 85  | :heavy_check_mark:  |
| **Branch**  | 66  | :x:  |
| **Method**  | 89  | :heavy_check_mark:  |
| **Class**  | 89  | :heavy_check_mark:  |

## Inputs

### `coverage-threshold`:
**Optional** - (default 80) -  The lower limit percentage of coverage for emoticons in the comment and failure threshold for line coverage

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

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE-MIT.txt).

