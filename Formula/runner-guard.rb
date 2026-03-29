# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.5.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.0/runner-guard_2.5.0_darwin_amd64.tar.gz"
      sha256 "e176e6cc115c1840dc29f8cd776854f2a71e7285d613df71988480f6c4d5f2e2"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.0/runner-guard_2.5.0_darwin_arm64.tar.gz"
      sha256 "df44cf221ce48d776af38f20ea4687e1f55adae81fcce779880b39e287a25d8f"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.0/runner-guard_2.5.0_linux_amd64.tar.gz"
      sha256 "872d5a8fcb28350b33d1799645e996dbd3dce92a5d5d4009f3739401a21704f7"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.0/runner-guard_2.5.0_linux_arm64.tar.gz"
      sha256 "d519b807f55c3dc2fc70ee7b00c0b8ed63cdc0a9188efdc4114f429b0d20c899"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
