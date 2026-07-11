class Starcat < Formula
  desc "Ephemeris computation and table presentation CLI"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/citest/starcat/0.11.0.tar.gz"
  sha256 "f71d081653c2c3b1eb549929792bbf2146c302758b8922887d7681d6dec1efde"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/mediumcoeli/releases/download/citest/starcat/0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "66e7fd121f9625f08d492366fe9337972e71d17f91b50ca2f63addcb4f717f0f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/starcat")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/starcat --version")
  end
end
