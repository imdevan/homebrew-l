class L < Formula
  desc "an ls replacement"
  homepage "https://devan.gg/l"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/l/releases/download/v0.3.0/l-darwin-amd64.tar.gz"
      sha256 "0a7028207d53b8e2da582bf7616078cfaa97cbe3fa56b4c795a8cc32decb133c"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/l/releases/download/v0.3.0/l-darwin-arm64.tar.gz"
      sha256 "946a98ab3e7489c25e5b60007ef5af6bc47654f363d377206da6179af90eb8cb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/imdevan/l/releases/download/v0.3.0/l-linux-amd64.tar.gz"
      sha256 "23d3d0dc7825a7b4cfb0db3bc244c619e4e210d5d526b1739b2f1ededffc823e"
    elsif Hardware::CPU.arm?
      url "https://github.com/imdevan/l/releases/download/v0.3.0/l-linux-arm64.tar.gz"
      sha256 "e72a8393aab5b007fce1f9672a5d84d5dbf3c60c0a9ca8cb9b6ad2440ea82925"
    end
  end

  def install
    binary = OS.mac? ? "l-darwin-" : "l-linux-"
    binary += Hardware::CPU.intel? ? "amd64" : "arm64"
    bin.install binary => "l"
  end

  test do
    assert_match "v0.3.0", shell_output("#{bin}/l --version")
  end
end
