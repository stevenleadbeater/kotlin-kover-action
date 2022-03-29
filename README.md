# GitHub Action for running coverage tests for kotlin projects using gradle and the Kover plugin

Run coverage tests, add the result to a PR as a comment and receive the results as output

## Usage
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
          proxy-url: https://add-pr-comment-proxy-94idvmwyie-uc.a.run.app
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

### `proxy-url`
**Optional** - A string for your proxy service URL if you'd like this to work with fork-based PRs

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

##Proxy for Fork-based PRs

GitHub limits GITHUB_TOKEN and other API access token permissions when creating a PR from a fork. This precludes adding comments when your PRs are coming from forks, which is the norm for open source projects. To work around this situation I've created a simple companion app you can deploy to Cloud Run or another host to proxy the create comment requests with a personal access token you provide.

See this issue: https://github.community/t/github-actions-are-severely-limited-on-prs/18179/4 for more details.

Check out the proxy service here: https://github.com/mshick/add-pr-comment-proxy

## License

The action and documentation in this project are released under the [MIT License](LICENSE-MIT.txt).

