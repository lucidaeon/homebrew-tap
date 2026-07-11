class Blackmoon < Formula
  desc "Reads any chart format, merges, writes any format"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/blackmoon/0.5.0.tar.gz"
  sha256 "fbdcc904da11f3236c2548b76c52d1764d4ce13dcd8c353ef2a7c968d9e419b4"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/mediumcoeli/releases/download/blackmoon/0.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3be094eac77621f69211a838b59d7f4be6ec8718c95ae327a5fd974a51ba84d2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/blackmoon")
  end

  test do
    assert_match "fields dropped on write", shell_output("#{bin}/blackmoon --capabilities")
  end
end
