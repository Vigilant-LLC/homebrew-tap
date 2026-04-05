# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.6.1"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.6.1/runner-guard_2.6.1_darwin_amd64.tar.gz"
      sha256 "4a8ba91e7dc553dc8601be6ccf9d7e25ae09420ae35f118491afd4968a57e38a"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.6.1/runner-guard_2.6.1_darwin_arm64.tar.gz"
      sha256 "dc74c93b397c7a90e2557542868fc03e8ca534d91b007cd6ff81b8be862550bb"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.6.1/runner-guard_2.6.1_linux_amd64.tar.gz"
      sha256 "ee4bbf1e16d8a06064d73c131b547114d8868b1a2893899fe9aba8a0b7f497e4"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.6.1/runner-guard_2.6.1_linux_arm64.tar.gz"
      sha256 "b2cdb8cff3ed57efd1409af2b59fe4bf1ac0341fac7066fbde69c7f4b079ee64"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
