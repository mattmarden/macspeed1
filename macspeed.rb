# Formula for Homebrew
# This file should be placed in a separate repository: mattmarden/homebrew-tap
# in the Formula/ directory

class Macspeed < Formula
  desc "Comprehensive, safe, and elegant performance optimization tool for macOS"
  homepage "https://github.com/mattmarden/macspeed1"
  url "https://github.com/mattmarden/macspeed1/archive/v2.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256_HASH"
  license "MIT"

  depends_on "python@3.12" => :build
  depends_on :macos => :monterey

  def install
    bin.install "macspeed"
    doc.install "README.md"
    doc.install "CHANGELOG.md"
    doc.install "docs/USAGE.md"
    doc.install "docs/CONTRIBUTING.md"
  end

  def caveats
    <<~EOS
      MacSpeed has been installed to #{bin}/macspeed

      Usage:
        macspeed                    Interactive mode with menu
        macspeed --essential        Apply essential optimizations (recommended)
        macspeed --status          Check current optimization status
        macspeed --help            Show all available options

      Documentation:
        #{doc}/README.md           Quick start guide
        #{doc}/USAGE.md            Detailed usage guide
        
      For more information:
        https://github.com/mattmarden/macspeed1

      Note: MacSpeed requires admin privileges for some optimizations.
      The tool is designed with safety as the top priority and includes
      complete reversion capabilities.
    EOS
  end

  test do
    # Test basic functionality
    assert_match "MacSpeed 2.1.0", shell_output("#{bin}/macspeed --version")
    
    # Test help command
    assert_match "macOS Performance Optimizer", shell_output("#{bin}/macspeed --help")
    
    # Test that script is executable and has proper shebang
    assert_predicate bin/"macspeed", :executable?
    
    # Test that script starts without errors (non-destructive)
    system "#{bin}/macspeed", "--status"
  end
end