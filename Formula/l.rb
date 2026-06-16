class L < Formula
  desc "an ls replacement"
  homepage "https://devan.gg/l"
  url "https://github.com/imdevan/l/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"l"), "./cmd/l"
  end

  test do
    assert_match "v0.1.0", shell_output("#{bin}/l --version")
  end
end
