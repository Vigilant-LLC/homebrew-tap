# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD supply chain security scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "3.1.3"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.3/runner-guard_3.1.3_darwin_amd64.tar.gz"
      sha256 "9558e687acda06e5221467f6e723c8c8ac6fda7836af95b5dc2050bb5f78fe43"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.3/runner-guard_3.1.3_darwin_arm64.tar.gz"
      sha256 "abfd194e2b384b79b39040ea906af99734758fde0c7b51f47613bb8ccdcf758b"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.3/runner-guard_3.1.3_linux_amd64.tar.gz"
      sha256 "dff56e1452769960c13076c98880d8b672784d83cdbab34a185f39cd6e77ea85"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.3/runner-guard_3.1.3_linux_arm64.tar.gz"
      sha256 "5f50faa9756ba94fb73b91ee59b07c12cdd2f7ae6e684378e775805043f6b085"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
