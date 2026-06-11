class Zithc < Formula
  desc "Zith is a low level & high level language designed to be powerfull & pleasant to write."
  homepage "https://galaxyhaze.github.io/Zith"
  url "https://github.com/GalaxyHaze/Zith/archive/refs/tags/v0.1.1.tar.gz"
  version "0.1.1"
  sha256 "41193f5ba85dd334173e0601ed3fa65d00ef842629ee67e12876818dbdfd45ac"
  license "MIT"

  depends_on "cmake" => :build

  resource "mio" do
    url "https://github.com/GalaxyHaze/Zith/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "41193f5ba85dd334173e0601ed3fa65d00ef842629ee67e12876818dbdfd45ac"
  end

  resource "tomlplusplus" do
    url "https://github.com/GalaxyHaze/Zith/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "41193f5ba85dd334173e0601ed3fa65d00ef842629ee67e12876818dbdfd45ac"
  end

  def install
    system "cmake", "-S", ".", "-B", "build", "-DZITH_VERSION=#{version}", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/zithc"
  end
end
