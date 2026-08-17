class Cvnt < Formula
  desc "Discerning greenlists constructed from a variety of authoritative criteria"
  homepage "https://github.com/lucidaeon/cvnt"
  url "https://github.com/lucidaeon/cvnt/archive/refs/tags/v0.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "CC0-1.0"
  head "https://github.com/lucidaeon/cvnt.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    generate_completions_from_executable(bin/"cvnt", "--generate-completion")
  end

  test do
    # `--capabilities` is derived from the crate's source registry, so this
    # exercises the built binary rather than a string constant, and needs no
    # network: it reports what the build can reach without reaching anything.
    assert_match "SOURCES", shell_output("#{bin}/cvnt --capabilities")
    assert_match "observation", shell_output("#{bin}/cvnt --capabilities")
  end
end
