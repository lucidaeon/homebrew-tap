class Blackmoon < Formula
  desc "Reads any chart format, merges, writes any format"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/blackmoon/0.6.1.tar.gz"
  sha256 "74961e648c456dfe3259641429acf61615836e61187f57aa9afb403573024f0e"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/mediumcoeli/releases/download/blackmoon/0.6.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2d49dd248f80245a7000a91460a013244894526dbebbdc3e5308ba83c04e1b37"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/blackmoon")
  end

  test do
    assert_match "fields dropped on write", shell_output("#{bin}/blackmoon --capabilities")
  end
end
