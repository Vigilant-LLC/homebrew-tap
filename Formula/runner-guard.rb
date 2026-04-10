# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD supply chain security scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "3.1.4"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.4/runner-guard_3.1.4_darwin_amd64.tar.gz"
      sha256 "a068d6c3dcb69ab36df09606dc38fae4de19b3a523ebdfbb5ddf78a84b83545b"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.4/runner-guard_3.1.4_darwin_arm64.tar.gz"
      sha256 "a5c26f02a1e5bd738bb4cdbd70904f453448f834320f4e844cd7d5cbe99b8f46"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.4/runner-guard_3.1.4_linux_amd64.tar.gz"
      sha256 "0ad157c5437bbbe4b62b93427e53c085f2e1ab82168fe82c623c4ce70a4de44f"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.4/runner-guard_3.1.4_linux_arm64.tar.gz"
      sha256 "780b56a69336a3072d00660bd3ef27edb8c9580b319b39ef5730212243155eaf"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
