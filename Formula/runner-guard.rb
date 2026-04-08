# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD supply chain security scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "3.1.2"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.2/runner-guard_3.1.2_darwin_amd64.tar.gz"
      sha256 "dc41c94afdc000150192554e43d8d11d5945b4f0187f998ccb3ed9ee4c8fcd34"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.2/runner-guard_3.1.2_darwin_arm64.tar.gz"
      sha256 "235faff7d147f95c14c458b9640d1cc162dc024715cf0fd6d9247a418b56297f"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.2/runner-guard_3.1.2_linux_amd64.tar.gz"
      sha256 "0587a996c32ba2d03a9e3a2c47db02b056f7c368cced4657b69ec10a8db8d285"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.2/runner-guard_3.1.2_linux_arm64.tar.gz"
      sha256 "92eb866f19bfa1ba109e83a1168ebe08cbf64c4d4ad1caf09f2b89e59f1beaf9"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
