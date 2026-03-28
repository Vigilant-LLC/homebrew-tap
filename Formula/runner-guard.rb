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
      sha256 "e8743dc6104d2fc5070cf35469a9e664c2df5c894a1776a02ff0e157d421134b"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_darwin_arm64.tar.gz"
      sha256 "5ed6e190b134e229c04e8ec1951c4090f4d89328db45564b4005e98e47793e51"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_linux_amd64.tar.gz"
      sha256 "e091db914ca7ba16a6353a2fcfb718d41bc744771bf23b9ba3b630d129b0dae0"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_linux_arm64.tar.gz"
      sha256 "9900291e7b3e850e5faa9f450a61e33612ec1d448f1e476470e7bdc889f9e3ff"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
