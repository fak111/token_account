# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A single-file Python CLI tool (`token`) that counts LLM tokens in files using tiktoken. Zero configuration - auto-installs tiktoken on first run.

## Repository Structure

```
token         # Main executable (Python 3.8+, uses tiktoken)
install.sh    # curl-pipe installer → ~/.local/bin/token
```

## Development

Run directly:
```bash
./token file.md              # Single file
./token -v src/              # Directory with verbose output
cat file.md | ./token        # Stdin pipe
./token --json file.md       # JSON output
./token -m gpt-4 file.md     # Different model encoding
```

No build step, no dependencies to install manually (tiktoken auto-installs).

## Architecture

Single-file design:
- `count_tokens()`: Uses tiktoken's model-specific encoding
- `count_file()`: Reads UTF-8 file, returns (path, token_count)
- `main()`: Argparse CLI with stdin detection, directory recursion, multiple output formats

The tool handles three modes: stdin pipe, single file (prints just the number), and multi-file/directory (prints table with totals).
