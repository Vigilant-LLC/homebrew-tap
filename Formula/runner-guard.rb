# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.4.6"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.6/runner-guard_2.4.6_darwin_amd64.tar.gz"
      sha256 "7f76b71c62b292fd49ed4b64f7b120035c89b6900d068e95146e8e1a7a1f64e6"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.6/runner-guard_2.4.6_darwin_arm64.tar.gz"
      sha256 "429b4b9b5da94757bcc7fceba6e5e900cbf5b11fc5209ce28c323e15d96c2f13"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.6/runner-guard_2.4.6_linux_amd64.tar.gz"
      sha256 "0127baf6388bc7a2d4ee336d14b53be3a7c21bc547b80c1f19272c406bfc6248"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.4.6/runner-guard_2.4.6_linux_arm64.tar.gz"
      sha256 "098ed52bde5283a506dea827a7ddf0e819530279c19d8480021e8a1ad35f4893"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
