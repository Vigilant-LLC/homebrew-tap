# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD supply chain security scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "3.0.2"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.2/runner-guard_3.0.2_darwin_amd64.tar.gz"
      sha256 "db55df3df2f6d1a8d345d9919345c0f19ef028875a6a22b21d6557dd33921b43"

      define_method(:install) do
        bin.install "runner-guard-darwin-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.2/runner-guard_3.0.2_darwin_arm64.tar.gz"
      sha256 "54c12fb7e8cc41c76ec9dfb823674e1ac915975bf9084db65ce4ddee0f1ad264"

      define_method(:install) do
        bin.install "runner-guard-darwin-arm64" => "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.2/runner-guard_3.0.2_linux_amd64.tar.gz"
      sha256 "a99d33977da14e9b17c7773e9aade43f9e14301811ecb4bae98a9b81a8522eb4"
      define_method(:install) do
        bin.install "runner-guard-linux-amd64" => "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.0.2/runner-guard_3.0.2_linux_arm64.tar.gz"
      sha256 "70febc4b049bc06ee9114c9495d9ac494b92819226ead550e1271ce01940a031"
      define_method(:install) do
        bin.install "runner-guard-linux-arm64" => "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
