class Starcat < Formula
  desc "Ephemeris computation and table presentation CLI"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/starcat/0.13.0.tar.gz"
  sha256 "d587611f1d43d73f9845780a65064d5262c92688f780b284959c657e15f816b8"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/mediumcoeli/releases/download/starcat/0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "0377bdbba12e0a094fae17eab88f250870c172d19d4bfe65ab4614fed6ae2cae"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/starcat")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/starcat --version")
  end
end
