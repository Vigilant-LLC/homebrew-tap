# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.4.7"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_darwin_amd64.tar.gz"
      sha256 "0c601ccb07f0cf0c9f603b5794b284c0caa4f0e89c8d0784a0ab49dc746b5aa3"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_darwin_arm64.tar.gz"
      sha256 "2795ecbee67fcd79786b72c1e761edfdc2f792158da8a0485c18812f97b6c508"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_linux_amd64.tar.gz"
      sha256 "30ba533588c444f1b18d853afafb884d417c13aa941b3ceeea56aa5d698895fe"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_linux_arm64.tar.gz"
      sha256 "4d32495c4c0195f1ae290f5aeca632ec41ad57d08ee2b725a2d28ac680c77c43"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
