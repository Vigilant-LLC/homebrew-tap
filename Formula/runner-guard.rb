# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD supply chain security scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "3.1.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.0/runner-guard_3.1.0_darwin_amd64.tar.gz"
      sha256 "7736e11756b50ccd29ef888aba05a05286fedb38e61906a835730a9386fa71ba"

      define_method(:install) do
        bin.install "runner-guard-darwin-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.0/runner-guard_3.1.0_darwin_arm64.tar.gz"
      sha256 "f2c563682d80864c0cccd167894db174026b92f07064c43971807bfd7e6a9469"

      define_method(:install) do
        bin.install "runner-guard-darwin-arm64" => "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.0/runner-guard_3.1.0_linux_amd64.tar.gz"
      sha256 "4bf7d977ab73f70621db5b1a0cb9d01df64b24ece0fd8426284a7bfc5ce34dc7"
      define_method(:install) do
        bin.install "runner-guard-linux-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.0/runner-guard_3.1.0_linux_arm64.tar.gz"
      sha256 "300d392cd5274122f688c7e4ff1ec3b8fa9aec7a25097d38dad8f752463f4220"
      define_method(:install) do
        bin.install "runner-guard-linux-arm64" => "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
