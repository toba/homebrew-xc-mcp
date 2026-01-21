class XcMcp < Formula
  desc "MCP server for Xcode development - build, test, run, and debug iOS/macOS apps"
  homepage "https://github.com/toba/xc-mcp"
  url "https://github.com/toba/xc-mcp/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "52c1616791eed2389fd3391f277f0e85afc27b50aa416f363d5ddf15a9e31f47"
  license "MIT"
  head "https://github.com/toba/xc-mcp.git", branch: "main"

  depends_on xcode: ["16.0", :build]
  depends_on :macos => :sequoia

  def install
    system "swift", "build",
           "--disable-sandbox",
           "-c", "release"

    bin.install ".build/release/xc-mcp"
    bin.install ".build/release/xc-project"
    bin.install ".build/release/xc-simulator"
    bin.install ".build/release/xc-device"
    bin.install ".build/release/xc-debug"
    bin.install ".build/release/xc-swift"
    bin.install ".build/release/xc-build"
  end

  def caveats
    <<~EOS
      xc-mcp requires Xcode for xcodebuild, simctl, and devicectl.

      Configure with Claude Code:
        claude mcp add xc-mcp -- #{bin}/xc-mcp

      Focused servers available: xc-project, xc-simulator, xc-device, xc-debug, xc-swift, xc-build
    EOS
  end

  test do
    assert_match "MCP server", shell_output("#{bin}/xc-mcp --help")
  end
end
