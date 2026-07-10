class Zithc < Formula
  desc "Zith is a low level & high level language designed to be powerfull & pleasant to write."
  homepage "https://galaxyhaze.github.io/Zith"
  url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.1.3.tar.gz"
  version "0.1.3"
  sha256 "36386699f876a017552a84479f27d7564efbbe8295b9efbc5b9eda0085d67fe7"
  license "MIT"

  depends_on "cmake" => :build

  resource "mio" do
    url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.1.3.tar.gz"
    sha256 "36386699f876a017552a84479f27d7564efbbe8295b9efbc5b9eda0085d67fe7"
  end

  resource "tomlplusplus" do
    url "https://github.com/GalaxyHaze/Zith-Lang/archive/refs/tags/v0.1.3.tar.gz"
    sha256 "36386699f876a017552a84479f27d7564efbbe8295b9efbc5b9eda0085d67fe7"
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
