# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.4.8"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.8/runner-guard_2.4.8_darwin_amd64.tar.gz"
      sha256 "107ef6758a2d770ccf2768e5033dc6ba4e552fca2fd39aa423b3a2df85b9fdf0"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.8/runner-guard_2.4.8_darwin_arm64.tar.gz"
      sha256 "a2aaa6ef560ca1e7423f28d8db3d7e4ed8368f35bae7534967eacb3e3ff0b808"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.8/runner-guard_2.4.8_linux_amd64.tar.gz"
      sha256 "e3da1debbb7476e671085c9337660b522858e7726ae345c53998ed776f506690"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.8/runner-guard_2.4.8_linux_arm64.tar.gz"
      sha256 "ed7bf0056266f0f745aba73bf1023fbf423897b96f2232df342fe0cbf3a5aacf"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
