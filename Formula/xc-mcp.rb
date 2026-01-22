class XcMcp < Formula
  desc "MCP server for Xcode development - build, test, run, and debug iOS/macOS apps"
  homepage "https://github.com/toba/xc-mcp"
  url "https://github.com/toba/xc-mcp/releases/download/v0.2.0/xc-mcp-v0.2.0-arm64.tar.gz"
  version "0.2.0"
  sha256 "92df76edb646901b34e2be7650a720dc7d97d7bc7fe99294309c199aab48c1e7"
  license "MIT"

  depends_on :macos => :sequoia
  depends_on arch: :arm64

  def install
    bin.install "xc-mcp"
    bin.install "xc-project"
    bin.install "xc-simulator"
    bin.install "xc-device"
    bin.install "xc-debug"
    bin.install "xc-swift"
    bin.install "xc-build"
    bin.install "xc-strings"
  end

  def caveats
    <<~EOS
      xc-mcp requires Xcode for xcodebuild, simctl, and devicectl.

      Configure with Claude Code:
        claude mcp add xc-mcp -- #{bin}/xc-mcp

      Focused servers available: xc-project, xc-simulator, xc-device, xc-debug, xc-swift, xc-build, xc-strings
    EOS
  end

  test do
    assert_match "MCP server", shell_output("#{bin}/xc-mcp --help")
  end
end
