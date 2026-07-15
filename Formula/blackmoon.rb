class Blackmoon < Formula
  desc "Reads any chart format, merges, writes any format"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/blackmoon/0.6.0.tar.gz"
  sha256 "7b46343cb9372a7e2baf4073332e379650cef564d208ed8b00a4ec175722b499"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/mediumcoeli/releases/download/blackmoon/0.6.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "bc7267e562a2ff02eb9d6085e50ba313ca0130a55f49e0328be7607e06f59037"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/blackmoon")
  end

  test do
    assert_match "fields dropped on write", shell_output("#{bin}/blackmoon --capabilities")
  end
end
