class XcMcp < Formula
  desc "MCP server for Xcode development - build, test, run, and debug iOS/macOS apps"
  homepage "https://github.com/toba/xc-mcp"
  url "https://github.com/toba/xc-mcp/releases/download/v1.13.2/xc-mcp-v1.13.2-arm64.tar.gz"
  version "1.13.2"
  sha256 "1af95b743b7e741ba5dacf3eab8cfead23f5d2759ee1f69006162ec72ce5b057"
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
