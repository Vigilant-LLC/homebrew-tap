# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.5.1"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.1/runner-guard_2.5.1_darwin_amd64.tar.gz"
      sha256 "3e9329384c769faa5278ec470ba3ba44a859032ff9b5912cef0f8c9ba85a982f"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.1/runner-guard_2.5.1_darwin_arm64.tar.gz"
      sha256 "62548f2401079ec494c17fa4d720ac33907f76506e3f809ca43a89b8d90108e6"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.1/runner-guard_2.5.1_linux_amd64.tar.gz"
      sha256 "4f2440bf29eafaaaa6638cfea2bc421b85a36ab5246f7e77e72d89d46e07599e"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.1/runner-guard_2.5.1_linux_arm64.tar.gz"
      sha256 "bb4b757ad4e309910d0736ca27b2e8bb17edb688aea6281761e5bea0c0aa1fcb"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
