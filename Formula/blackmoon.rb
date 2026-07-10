class Blackmoon < Formula
  desc "Reads any chart format, merges, writes any format"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/blackmoon/0.4.3.tar.gz"
  sha256 "1675f28e09073404a9bfad5b8b3a58e61bd5d01a56ad19ce09e5bda61c1faea9"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/homebrew-tap/releases/download/blackmoon-0.4.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ebbb57f8bd273ed37a4a2dc036f98333f27472fe0188c86f54a11882ffaefaea"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/blackmoon")
  end

  test do
    assert_match "fields dropped on write", shell_output("#{bin}/blackmoon --capabilities")
  end
end
