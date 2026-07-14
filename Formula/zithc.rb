class Zithc < Formula
  desc "Zith is a low level & high level language designed to be powerfull & pleasant to write."
  homepage "https://galaxyhaze.github.io/Zith"
  url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.1.4.tar.gz"
  version "0.1.4"
  sha256 "9063d0749cb3ed9eb6d801a87daf5dda8102ccb3e1f87a200e4d429eb65c156a"
  license "MIT"

  depends_on "cmake" => :build

  resource "mio" do
    url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.1.4.tar.gz"
    sha256 "9063d0749cb3ed9eb6d801a87daf5dda8102ccb3e1f87a200e4d429eb65c156a"
  end

  resource "tomlplusplus" do
    url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.1.4.tar.gz"
    sha256 "9063d0749cb3ed9eb6d801a87daf5dda8102ccb3e1f87a200e4d429eb65c156a"
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
