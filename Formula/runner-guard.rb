# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD supply chain security scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.9.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.9.0/runner-guard_2.9.0_darwin_amd64.tar.gz"
      sha256 "4503d1c6451f1bcc8c4ee908dd1ec8cc20fa6e5534b945c31c88a8b43b684f2c"

      define_method(:install) do
        bin.install "runner-guard-darwin-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.9.0/runner-guard_2.9.0_darwin_arm64.tar.gz"
      sha256 "535b14f58384217f827765b2d2f20bcf07be6db5538105bceddc4720820d192d"

      define_method(:install) do
        bin.install "runner-guard-darwin-arm64" => "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.9.0/runner-guard_2.9.0_linux_amd64.tar.gz"
      sha256 "61bbed2a6e9c7ff62de4dc4935860fc7d260fa6017292ab30aa3d0c69919ae77"
      define_method(:install) do
        bin.install "runner-guard-linux-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.9.0/runner-guard_2.9.0_linux_arm64.tar.gz"
      sha256 "5e8940c70ea4f29329c87c5030bfdc63a6548e502277ca9fc7cb3f5248952b4d"
      define_method(:install) do
        bin.install "runner-guard-linux-arm64" => "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
