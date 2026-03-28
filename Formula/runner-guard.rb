# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.4.7"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_darwin_amd64.tar.gz"
      sha256 "54cdc936251bf1ff276970588f5b97981575a2f887fe5d9bb1e0009c1fd4c124"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_darwin_arm64.tar.gz"
      sha256 "5b598fee162a734980b059f3d7de72011c27a42f15624b952646eebbb29cc783"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_linux_amd64.tar.gz"
      sha256 "25e055aa2502cac044718b266833f82807cceb6cd179d29a31d623224f3d249c"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.7/runner-guard_2.4.7_linux_arm64.tar.gz"
      sha256 "be4f3ba83e2c319349037bdaed24583ee047763301974d9a8be4aa3dd7d7992d"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
