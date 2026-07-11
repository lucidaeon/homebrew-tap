class Starcat < Formula
  desc "Ephemeris computation and table presentation CLI"
  homepage "https://github.com/lucidaeon/mediumcoeli"
  url "https://github.com/lucidaeon/mediumcoeli/archive/refs/tags/starcat/0.10.0.tar.gz"
  sha256 "68517f8caf4fcab61aba4272e5e38930f61d7bed87a89d00d9ac6797afb4edfe"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/mediumcoeli.git", branch: "main"

  bottle do
    root_url "https://github.com/lucidaeon/mediumcoeli/releases/download/starcat/0.10.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "18e64f4d184b19e9b21f8a02ec921c7616771940061a78629bb946c8835212e2"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/starcat")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/starcat --version")
  end
end
