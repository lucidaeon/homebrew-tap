class Blackmoon < Formula
  desc "Reads any chart format, merges, writes any format"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/blackmoon/0.4.0.tar.gz"
  version "0.4.0"
  sha256 "27bdd7f94e6e4bb3ae4faedbd17756750f345145af891c2440d62e7ae3e941ed"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/blackmoon")
  end

  test do
    assert_match "fields dropped on write", shell_output("#{bin}/blackmoon --capabilities")
  end
end
