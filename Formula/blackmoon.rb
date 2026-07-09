class Blackmoon < Formula
  desc "Reads any chart format, merges, writes any format"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/blackmoon/0.4.2.tar.gz"
  sha256 "bbc5b9aba932a3256dd0987aee46a5239820da44ef22e8b604adb4abf61f7cd1"
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
