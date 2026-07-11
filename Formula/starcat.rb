class Starcat < Formula
  desc "Ephemeris computation and table presentation CLI"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/starcat/0.12.0.tar.gz"
  sha256 "1f1f0cffd3db93b01722d4021ff56611641fbf7e503ecc82e464c5c69630ffd6"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/mediumcoeli/releases/download/starcat/0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7dc5ca881de882cb30e78c9fe571c60da158d604f0c768d8927d81cc3b42fe0e"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/starcat")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/starcat --version")
  end
end
