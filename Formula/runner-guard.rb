# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.4.9"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.9/runner-guard_2.4.9_darwin_amd64.tar.gz"
      sha256 "400f0c19109c7a7847a259bd08e0f667e72acb552c84dbc3e31a4ff9fb3cd11a"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.9/runner-guard_2.4.9_darwin_arm64.tar.gz"
      sha256 "04fe767f27f67c34cfaedd3872bbba3af041f6a0362fdac3e9ba506893458f83"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.9/runner-guard_2.4.9_linux_amd64.tar.gz"
      sha256 "05fab8646e20981c39e1720d50bf70891e511318eddfd076b2a01d8dbf073656"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.9/runner-guard_2.4.9_linux_arm64.tar.gz"
      sha256 "3bf9ba1e3eb7659d4296820a7d40acd036dbd362e64e4b986a680787a0c1eeae"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
