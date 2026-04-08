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
      sha256 "10d6a6d67fe15a9cbe96deedf5b5b7c812bc108280570f311f68e30387fd6041"

      define_method(:install) do
        bin.install "runner-guard-darwin-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.1/runner-guard_3.0.1_darwin_arm64.tar.gz"
      sha256 "9777f88074eec869d182db597db2799f0489cccc1cefe5ad5cd4b9ac4854772f"

      define_method(:install) do
        bin.install "runner-guard-darwin-arm64" => "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.1/runner-guard_3.0.1_linux_amd64.tar.gz"
      sha256 "991d0d09de1c28f00db0592cef16b66bdaa9bba779a7fbcf2e32ba4ed8a5cd5d"
      define_method(:install) do
        bin.install "runner-guard-linux-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.1/runner-guard_3.0.1_linux_arm64.tar.gz"
      sha256 "55910001fe8f4bee12ac987ed00b4a72a54f1d40e357661458195787e81accc0"
      define_method(:install) do
        bin.install "runner-guard-linux-arm64" => "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
