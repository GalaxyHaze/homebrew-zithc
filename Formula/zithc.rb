class Zithc < Formula
  desc "Zith is a low level & high level language designed to be powerfull & pleasant to write."
  homepage "https://galaxyhaze.github.io/Zith"
  url "https://github.com/GalaxyHaze/Zith/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "2818ba5f90f1f399c4ee6b741501077e4382ad9347b78c622823d7383e128002"
  license "MIT"

  depends_on "cmake" => :build

  resource "mio" do
    url "https://github.com/GalaxyHaze/Zith/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "2818ba5f90f1f399c4ee6b741501077e4382ad9347b78c622823d7383e128002"
  end

  resource "tomlplusplus" do
    url "https://github.com/GalaxyHaze/Zith/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "2818ba5f90f1f399c4ee6b741501077e4382ad9347b78c622823d7383e128002"
  end

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/zithc"
  end
end
