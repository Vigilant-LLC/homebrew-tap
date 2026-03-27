# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.4.3"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.3/runner-guard_2.4.3_darwin_amd64.tar.gz"
      sha256 "5e83a1b67062d9aece9b891f2bc0e6d8f26077645136feb623281768db4756eb"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.3/runner-guard_2.4.3_darwin_arm64.tar.gz"
      sha256 "81cf8ffe4a1cb77e10f1fef324e6d4b70e79300554df61e829e87d38af8a1f59"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.3/runner-guard_2.4.3_linux_amd64.tar.gz"
      sha256 "1f05427e177bca419a668b1104a5028028fc898f2905f3514d4070654d5cbb7e"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.3/runner-guard_2.4.3_linux_arm64.tar.gz"
      sha256 "a978375af8234a4909ebf85e311493f3c0a189cf3af7e7884e7f1e80eca98699"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
