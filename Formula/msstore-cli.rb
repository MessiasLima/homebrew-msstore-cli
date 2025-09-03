class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.3.0"
    checksums = {
      "osx-arm64" => "32806fb41c4fe9e9fee15d386cabde9c906b2d98163fed15b7f80cb8957970bc",
      "osx-x64" => "5fc4b9fe2de082e1d3a86f95d915ac03a78b60bd317a96963d37417afdb9bc2b",
      "linux-arm64"  => "4cf2e38a9e8bad67f8a2f2596cbad5b68b8aa33e7c3a9941ac7e1acdb71ef8db",
      "linux-x64"  => "25fbab28836a4b9447ecc8ea0adba2c2d992a460b0e7139667ac7ef8287d3ab0"
    }

    os = OS.mac? ? "osx" : "linux"
    arch = case Hardware::CPU.arch
    when :x86_64 then "x64"
    when :arm64 then "arm64"
    else
      raise "Unsupported arch #{Hardware::CPU.arch}"
    end

    url "https://github.com/microsoft/msstore-cli/releases/download/v#{version}/MSStoreCLI-#{os}-#{arch}.tar.gz"
    sha256 checksums["#{os}-#{arch}"]

    def install
      bin.install "msstore"
    end
end
