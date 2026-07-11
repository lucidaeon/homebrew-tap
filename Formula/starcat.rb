class Starcat < Formula
  desc "Ephemeris computation and table presentation CLI"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/citest/starcat/0.11.0.tar.gz"
  sha256 "46bb65aeff266263fa3584f877e606ff51c8056a7a453a758b3323e696252f0a"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/mediumcoeli/releases/download/citest/starcat/0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4f08ec94cb4d2bba52bc93c906bc6bca47263fc7d239602b61b46b17a857309b"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/starcat")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/starcat --version")
  end
end
