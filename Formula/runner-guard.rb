# typed: false
# frozen_string_literal: true

class RunnerGuard < Formula
  desc "CI/CD source-to-sink vulnerability scanner for GitHub Actions"
  homepage "https://github.com/Vigilant-LLC/runner-guard"
  version "2.8.0"
  license "AGPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.8.0/runner-guard_2.8.0_darwin_amd64.tar.gz"
      sha256 "3a370b8c01a29a5391ad332ec322687d61b7a6b045e7789ea5305e1dfada5096"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.8.0/runner-guard_2.8.0_darwin_arm64.tar.gz"
      sha256 "74c2748674d4c28653809defb17a5af47496b662e0d5163b565545f025d610ea"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.8.0/runner-guard_2.8.0_linux_amd64.tar.gz"
      sha256 "35be6e50c673e7c3848fd5ba3169bfc84ff4fff809c8ae4755081cd7b750e1bd"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Vigilant-LLC/runner-guard/releases/download/v2.8.0/runner-guard_2.8.0_linux_arm64.tar.gz"
      sha256 "5b96321551f9e59a404fcd457d9dc81d9751918d5a43a984def0f84cf358fc4f"
      define_method(:install) do
        bin.install "runner-guard"
      end
    end
  end

  test do
    system "#{bin}/runner-guard", "--version"
  end
end
