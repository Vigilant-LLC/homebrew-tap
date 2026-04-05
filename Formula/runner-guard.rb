# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.7.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.7.0/runner-guard_2.7.0_darwin_amd64.tar.gz"
      sha256 "fe6ac0f94f6630183496901426f649e9372011ea33afe54df5f26278cfa0add4"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.7.0/runner-guard_2.7.0_darwin_arm64.tar.gz"
      sha256 "e06e22b3a219ae133794ef5cdde1c7fe1372c4df614261cad79a74a49a47a831"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.7.0/runner-guard_2.7.0_linux_amd64.tar.gz"
      sha256 "a14b60641f4f91a78940c9a8072ba1cb51186a8b2787652da1d4b5af6b48ca56"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.7.0/runner-guard_2.7.0_linux_arm64.tar.gz"
      sha256 "df2ccb4e67ba175d76bd680c86e019779a01b3e191194b62cb34cbef5e24cde5"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
