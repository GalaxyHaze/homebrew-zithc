class Zithc < Formula
  desc "Zith is a low level & high level language designed to be powerfull & pleasant to write."
  homepage "https://galaxyhaze.github.io/Zith"
  url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.6.2.tar.gz"
  version "0.6.2"
  sha256 "c150833e195ccf1f1109490c48c8a442979b19a7070806f2795b452249bf2422"
  license "MIT"

  depends_on "cmake" => :build

  resource "mio" do
    url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.6.2.tar.gz"
    sha256 "c150833e195ccf1f1109490c48c8a442979b19a7070806f2795b452249bf2422"
  end

  resource "tomlplusplus" do
    url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.6.2.tar.gz"
    sha256 "c150833e195ccf1f1109490c48c8a442979b19a7070806f2795b452249bf2422"
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
