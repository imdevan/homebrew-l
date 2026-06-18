class L < Formula
  desc "an ls replacement"
  homepage "https://devan.gg/l"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/l/releases/download/v0.3.0/l-darwin-amd64.tar.gz"
      sha256 "c6dfa9f3f17463704fbeeb5be82b8dbbceb6c9934d192a7d53bbca5c9ded967a"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/l/releases/download/v0.3.0/l-darwin-arm64.tar.gz"
      sha256 "8d66754b8799e64a8d9f4287fbd573fa17c75cfec336e907f19cfa49a17d151f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/l/releases/download/v0.3.0/l-linux-amd64.tar.gz"
      sha256 "59ca517fc81cefe20dcba026fb46f7aa241d33f9bb8821e6e6b484b32b0e40c1"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/l/releases/download/v0.3.0/l-linux-arm64.tar.gz"
      sha256 "9ac8e26ff761b7900be9bca3ff2cfb006bbaf5766abf14cf56ae8116d79bedc2"
    end
  end

  def install
    bin.install "l"
  end

  test do
    assert_match "v0.3.0", shell_output("#{bin}/l --version")
  end
end
