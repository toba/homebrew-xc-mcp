# Homebrew Tap for xc-mcp

This is the official Homebrew tap for [xc-mcp](https://github.com/toba/xc-mcp), an MCP server for Xcode development.

## Acknowledgments

xc-mcp is an amalgamation of excellent work by others. Full credit goes to the original tool builders:

- **[giginet/xcodeproj-mcp-server](https://github.com/giginet/xcodeproj-mcp-server)** - The original MCP server for Xcode project manipulation that xc-mcp is based on
- **[tuist/xcodeproj](https://github.com/tuist/xcodeproj)** - Swift library for reading and writing Xcode project files
- **[modelcontextprotocol/swift-sdk](https://github.com/modelcontextprotocol/swift-sdk)** - Official Swift SDK for the Model Context Protocol
- **[Ryu0118/xcstrings-crud](https://github.com/Ryu0118/xcstrings-crud)** - Foundation for the .xcstrings localization functionality

## Installation

```bash
brew tap toba/xc-mcp
brew install xc-mcp
```

## What's Included

Installing `xc-mcp` provides the following executables:

| Command | Description |
|---------|-------------|
| `xc-mcp` | Full MCP server with all Xcode tools |
| `xc-project` | Project manipulation tools only |
| `xc-simulator` | iOS Simulator tools only |
| `xc-device` | Physical device tools only |
| `xc-debug` | LLDB debugging tools only |
| `xc-swift` | Swift Package Manager tools only |
| `xc-build` | Build and run tools only |

## Configuration

### Claude Code

```bash
claude mcp add xc-mcp -- $(brew --prefix)/bin/xc-mcp
```

### Other MCP Clients

Add to your MCP configuration:

```json
{
  "mcpServers": {
    "xc-mcp": {
      "command": "/opt/homebrew/bin/xc-mcp"
    }
  }
}
```

## Updating

```bash
brew update
brew upgrade xc-mcp
```

## Uninstalling

```bash
brew uninstall xc-mcp
brew untap toba/xc-mcp
```

## Requirements

- macOS Sequoia (15.0) or later
- Xcode 16.0 or later

## Issues

Report issues at [toba/xc-mcp](https://github.com/toba/xc-mcp/issues).
