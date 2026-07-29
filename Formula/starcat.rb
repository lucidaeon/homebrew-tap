class Starcat < Formula
  desc "Ephemeris computation and table presentation CLI"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/starcat/0.14.0.tar.gz"
  sha256 "2d3472271b294666b8a229a93c5642fa812a5858c2f92b2a62ae001b26a14553"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/mediumcoeli/releases/download/starcat/0.14.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "91ed43862b1ec43647a651f4b34483f467c4ba4c71ffe29362ad69b39c6c075a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/starcat")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/starcat --version")
  end
end
