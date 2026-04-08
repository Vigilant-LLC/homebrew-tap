# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD supply chain security scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "3.1.1"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.1/runner-guard_3.1.1_darwin_amd64.tar.gz"
      sha256 "ed9a1efb5e4dcce628a3b1e88f01143e25cd34e18348896ab80cf063f1b151af"
      define_method(:install) do
        bin.install "runner-guard-darwin-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.1/runner-guard_3.1.1_darwin_arm64.tar.gz"
      sha256 "7bd71909e89b8f0f425c10ba2af93aeb2e2e0221f9b066985f4e1ef366310e07"
      define_method(:install) do
        bin.install "runner-guard-darwin-arm64" => "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.1/runner-guard_3.1.1_linux_amd64.tar.gz"
      sha256 "65465d427f67780115936ed928b9474b22ec870c157fb1146640816d961ae618"
      define_method(:install) do
        bin.install "runner-guard-linux-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.1/runner-guard_3.1.1_linux_arm64.tar.gz"
      sha256 "2e3d61e4822e68fdfaf6e0da9a885c1d55f9b7ce3ae2b067579f3c1cea855561"
      define_method(:install) do
        bin.install "runner-guard-linux-arm64" => "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
