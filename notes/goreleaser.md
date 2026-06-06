# GoReleaser

## CLI

Manual release after pushing changes and a tag.

```bash
git push && git tag -a 2.0.3 -m "" && git push origin 2.0.3 && goreleaser --clean
```

## GitHub Actions

Workflow runs GoReleaser after pushing a tag.

```yaml
name: Release

on:
  push:
    tags:
      - "v*"
      - "*"

permissions:
  contents: write

jobs:
  goreleaser:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v5
        with:
          fetch-depth: 0

      - name: Set up Go
        uses: actions/setup-go@v6
        with:
          go-version: "1.24.0"

      - name: Run GoReleaser
        uses: goreleaser/goreleaser-action@v7
        with:
          distribution: goreleaser
          version: latest
          args: release --clean
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
