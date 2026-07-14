class Zithc < Formula
  desc "Zith is a low level & high level language designed to be powerfull & pleasant to write."
  homepage "https://galaxyhaze.github.io/Zith"
  url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.1.5.tar.gz"
  version "0.1.5"
  sha256 "52e4497f69b3f65ead06d3fe5a901ef7be3d9e81141a8f1c84d23b5c070cc2f0"
  license "MIT"

  depends_on "cmake" => :build

  resource "mio" do
    url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.1.5.tar.gz"
    sha256 "52e4497f69b3f65ead06d3fe5a901ef7be3d9e81141a8f1c84d23b5c070cc2f0"
  end

  resource "tomlplusplus" do
    url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.1.5.tar.gz"
    sha256 "52e4497f69b3f65ead06d3fe5a901ef7be3d9e81141a8f1c84d23b5c070cc2f0"
  end

  def install
    system "cmake", "-S", ".", "-B", "build", "-DZITH_VERSION=#{version}", "-DHOMEBREW_ALLOW_FETCHCONTENT=ON", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/zithc"
  end
end
