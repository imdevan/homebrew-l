class L < Formula
  desc "an ls replacement"
  homepage "https://devan.gg/l"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/l/releases/download/v0.4.0/l-darwin-amd64.tar.gz"
      sha256 "a9c3f50f0d0d74b95dbff38d24812d63e7e5b54f14917daf4470d04aa50b7072"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/l/releases/download/v0.4.0/l-darwin-arm64.tar.gz"
      sha256 "ffab14dce777425abb5c493e6db82b9622e88895ae2662cce47b93186315684a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/l/releases/download/v0.4.0/l-linux-amd64.tar.gz"
      sha256 "db8c71b0143de814f6fa8fe827a8ac44dbff763a6f842775af5b02e6ef667afd"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/l/releases/download/v0.4.0/l-linux-arm64.tar.gz"
      sha256 "1de572f1d575c9128b79347bc8007fb019e6b83217d3f8d13f77617b153def17"
    end
  end

  def install
    binary = OS.mac? ? "l-darwin-" : "l-linux-"
    binary += Hardware::CPU.intel? ? "amd64" : "arm64"
    bin.install binary => "l"
  end

  test do
    assert_match "v0.4.0", shell_output("#{bin}/l --version")
  end
end
