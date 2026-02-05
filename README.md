# token

Count LLM tokens for files. Simple, fast, zero-config.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/fak111/token_account/main/install.sh | bash
```

## Usage

```bash
token file.md                # Single file → 1234
token file1.md file2.md      # Multiple files (line by line)
token -v file.md             # Verbose mode
token --json file.md         # JSON output
cat file.md | token          # stdin pipe
token -m gpt-4 file.md       # Specify model
token src/                   # Count all files in directory
```

## Options

| Option | Description |
|--------|-------------|
| `-m, --model` | Model for tokenization (default: gpt-4o) |
| `-v, --verbose` | Show detailed output |
| `--json` | Output as JSON |

## Examples

```bash
# Count tokens in a single file
$ token README.md
256

# Count multiple files with verbose output
$ token -v src/*.py
src/main.py      1234
src/utils.py      567
------------------
Total            1801

# JSON output for scripting
$ token --json file.md
{"files": [{"path": "file.md", "tokens": 256}], "total": 256}

# Pipe from stdin
$ cat file.md | token
256
```

## Requirements

- Python 3.8+
- tiktoken (auto-installed on first run)

## License

MIT
