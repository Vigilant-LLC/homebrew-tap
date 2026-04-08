# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD supply chain security scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "3.0.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.0/runner-guard_3.0.0_darwin_amd64.tar.gz"
      sha256 "254c245718bbd59d393824320348ac185ab3a940e35e460ff3ddc209a1f5a9c0"

      define_method(:install) do
        bin.install "runner-guard-darwin-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.0/runner-guard_3.0.0_darwin_arm64.tar.gz"
      sha256 "7e8046412701fdedcb2e2c04ca089e12896de750cb042aa207c883a8ab5f0680"

      define_method(:install) do
        bin.install "runner-guard-darwin-arm64" => "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.0/runner-guard_3.0.0_linux_amd64.tar.gz"
      sha256 "19da0f4d58e4660f4d3e76ca17cb19ff0ed5a624ba3538347d00c40cf6e6e926"
      define_method(:install) do
        bin.install "runner-guard-linux-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.0/runner-guard_3.0.0_linux_arm64.tar.gz"
      sha256 "072c5ad79ca5354e59c44b41f511f2af94b802db1e648f4d8bdb77d42273cdfd"
      define_method(:install) do
        bin.install "runner-guard-linux-arm64" => "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
