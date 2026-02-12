class MsstoreCli < Formula
    desc "Microsoft Store Command Line Tool"
    homepage "https://github.com/microsoft/msstore-cli"
    license "MIT"
    version "0.3.9"
    checksums = {
      "osx-arm64" => "153d5762a0fb7f8c353fa4dba4abc584649bba33329b576e13b48c23483dc8af",
      "osx-x64" => "e293f52e726a8ac479b344cf20b681c60d1be481068940b4fb9d65a236620de1",
      "linux-arm64"  => "1fcd5e24bf69a4ed263ebbf27db2693a1c9f45ea7969aa202d886291467efaaa",
      "linux-x64"  => "440986d7de67ea216eebdc0e13b310006f4e9f4114508adf473e89eb998bd0d4"
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
