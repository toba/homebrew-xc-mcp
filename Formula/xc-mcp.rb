class XcMcp < Formula
  desc "MCP server for Xcode development - build, test, run, and debug iOS/macOS apps"
  homepage "https://github.com/toba/xc-mcp"
  url "https://github.com/toba/xc-mcp/releases/download/v1.28.4/xc-mcp-v1.28.4-arm64.tar.gz"
  version "1.28.4"
  sha256 "d40cf1e569e0431ba823daca2429870a11cefc64e762c8c78515ea83463f5207"
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
