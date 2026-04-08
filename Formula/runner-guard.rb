# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD supply chain security scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "3.0.1"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.1/runner-guard_3.0.1_darwin_amd64.tar.gz"
      sha256 "93ea7a7b6d1fadd59f2a52caaceba837e361ede9e0f739a9ea9d3aca242d4c2a"

      define_method(:install) do
        bin.install "runner-guard-darwin-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.1/runner-guard_3.0.1_darwin_arm64.tar.gz"
      sha256 "02469c557ea07e2f1751ae46ebbc7da1ee62c4bc86e6b673a4df93f27033e335"

      define_method(:install) do
        bin.install "runner-guard-darwin-arm64" => "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.1/runner-guard_3.0.1_linux_amd64.tar.gz"
      sha256 "483bbf4a1bbb92d8b9a3b26977901f567c8fe0ca6d5f29a885f9b5d04f1af9b7"
      define_method(:install) do
        bin.install "runner-guard-linux-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.1/runner-guard_3.0.1_linux_arm64.tar.gz"
      sha256 "8f6ed34c00dfc49b7122bee4e20edacbea7771bdc5d1a77322e473a742f42189"
      define_method(:install) do
        bin.install "runner-guard-linux-arm64" => "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
