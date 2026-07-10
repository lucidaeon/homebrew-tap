class Starcat < Formula
  desc "Ephemeris computation and table presentation CLI"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/citest/starcat/0.11.0.tar.gz"
  sha256 "2ec28af51eea3bba18ec14dbaa9e6498336f6cffbbe8556809547074f8eeb492"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/mediumcoeli/releases/download/citest/starcat/0.11.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "81be546e11e885720fb4aa753f92a6268b55413544ed71dbaa9aecd7b7123920"
  end


  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/starcat")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/starcat --version")
  end
end
