# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD supply chain security scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "3.1.5"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.5/runner-guard_3.1.5_darwin_amd64.tar.gz"
      sha256 "0ac69efa18e923190cb5679805fc990dac07acd6b91f4a886ca231abd0396914"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.5/runner-guard_3.1.5_darwin_arm64.tar.gz"
      sha256 "b31da1838e9dc78582c6baab16c775368273718bf38f28f52cae24160d911f55"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.5/runner-guard_3.1.5_linux_amd64.tar.gz"
      sha256 "cdf54cc5a4379cebdabc4e63b0b2f2066dccc2e0dfc6fb3b46d2db5fdef674e1"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v3.1.5/runner-guard_3.1.5_linux_arm64.tar.gz"
      sha256 "b6628642ecc8f56be8461449ab7bb873f02ddba22bc749500a7b39e51c7472e9"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "version"
  end
end
