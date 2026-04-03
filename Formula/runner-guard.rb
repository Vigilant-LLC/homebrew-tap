# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.6.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.6.0/runner-guard_2.6.0_darwin_amd64.tar.gz"
      sha256 "6768e880b2db104b02fd3296cc71c9a3041b6464cb63056cb843f3d28a765c30"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.6.0/runner-guard_2.6.0_darwin_arm64.tar.gz"
      sha256 "1e898fe5a52e96f4b0ca5c67693fd9a7912bfd78e20f3d3c0eeccfc784f16819"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.6.0/runner-guard_2.6.0_linux_amd64.tar.gz"
      sha256 "6955b68b44946626d58378db2ab4075fb7c2a4307f5e7540ea89598005a85915"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.6.0/runner-guard_2.6.0_linux_arm64.tar.gz"
      sha256 "9e07e34aefa045b06a232791a9bedcc715c3aa26231eaf7b8833155e8446fffe"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
