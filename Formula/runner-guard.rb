# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.5.2"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.2/runner-guard_2.5.2_darwin_amd64.tar.gz"
      sha256 "ef346acb32b7a3fd4f4665f303b1a56b401fa4215e039c631318f0057330b9b5"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.2/runner-guard_2.5.2_darwin_arm64.tar.gz"
      sha256 "39d3f6280c4fdc326cf8748ec8f250ce78524517340b552d845366d09e7a7129"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.2/runner-guard_2.5.2_linux_amd64.tar.gz"
      sha256 "cb7542d7059eb7eed242000c8fe3016dff24e5dd0fcad0d3217923f07190db96"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.5.2/runner-guard_2.5.2_linux_arm64.tar.gz"
      sha256 "2ecf9476a7a7b33e5036ae437869276fc7ab597a804f511301eb9498379a2ee8"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
