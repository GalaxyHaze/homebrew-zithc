class Zith < Formula
  desc "Zith is a low level & high level language designed to be powerfull & pleasant to write."
  homepage "https://galaxyhaze.github.io/Zith"
  url "https://github.com/GalaxyHaze/Zith/archive/e92ee52b833995686c67775b40c8908618476b95.tar.gz"
  version "0.1.0"
  sha256 "3d316c51dccd4e4874a7365ac34ee94c1920c19a8e4c13ac506f9010b16e3f60"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "libffi"
  depends_on "llvm"

  resource "cli11" do
    url "https://github.com/CLIUtils/CLI11/archive/refs/tags/v2.4.1.tar.gz"
    sha256 "73b7ec52261ce8fe980a29df6b4ceb66243bb0b779451dbd3d014cfec9fdbb58"
  end

  resource "tomlplusplus" do
    url "https://github.com/marzer/tomlplusplus/archive/refs/tags/v3.4.0.tar.gz"
    sha256 "8517f65938a4faae9ccf8ebb36631a38c1cadfb5efa85d9a72e15b9e97d25155"
  end

  def install
    resource("cli11").stage(buildpath/"deps/cli11")
    resource("tomlplusplus").stage(buildpath/"deps/tomlplusplus")

    system "cmake", "-S", "scripts", "-B", "build",
           *std_cmake_args,
           "-DFETCHCONTENT_SOURCE_DIR_CLI11=#{buildpath}/deps/cli11",
           "-DFETCHCONTENT_SOURCE_DIR_TOMLPLUSPLUS=#{buildpath}/deps/tomlplusplus"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/zith", "--version"
  end
end
