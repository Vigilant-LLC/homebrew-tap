# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.4.4"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.4/runner-guard_2.4.4_darwin_amd64.tar.gz"
      sha256 "854e3ab67855ba7db21873bd496d68bec0de96bb5a142bd1a1e1e0dc3d8f961d"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.4/runner-guard_2.4.4_darwin_arm64.tar.gz"
      sha256 "f31e12d618881aa2fbaa2a089a132fbaaf9cc64dd8d4adb66d1aca1a16165635"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.4/runner-guard_2.4.4_linux_amd64.tar.gz"
      sha256 "2bb4ae16e69bab499df01d94bb23346d2ad646d46e5318f6379a51dc0f8149a9"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.4/runner-guard_2.4.4_linux_arm64.tar.gz"
      sha256 "f31456a2c055d024cd9648e73a37f8d4d74888cbef1a846437443c390a7aed2f"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
