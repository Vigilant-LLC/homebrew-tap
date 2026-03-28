# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.4.5"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.5/runner-guard_2.4.5_darwin_amd64.tar.gz"
      sha256 "725eb34eb45ec6cfdae303b6474c07d56f6b651740f05b77dddca054ac488bea"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.5/runner-guard_2.4.5_darwin_arm64.tar.gz"
      sha256 "828fdb123329898f1e17a44703c5f8a5e9a29b8104a67bda0ae45411f8077201"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.5/runner-guard_2.4.5_linux_amd64.tar.gz"
      sha256 "00c14493d8c88fc6b9ddae1653f880650bc001d0c98ded1d0107e89084808cf8"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.5/runner-guard_2.4.5_linux_arm64.tar.gz"
      sha256 "b0651613ca8820a20ed4fe71a6c4d1ee0da0960d4d9f0eabb76af6ecfe4b7aad"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
