class Ferlay < Formula
  desc "Start and manage Claude Code sessions from your phone"
  homepage "https://github.com/y0sif/ferlay"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/y0sif/ferlay/releases/download/v#{version}/ferlay-daemon-macos-aarch64.tar.gz"
      sha256 "82212a309e34df3371641d0aa3ffcb8b15774ad88455ec4377e5182a72c356f0"

      def install
        bin.install "ferlay-daemon-macos-aarch64" => "ferlay"
      end
    else
      url "https://github.com/y0sif/ferlay/releases/download/v#{version}/ferlay-daemon-macos-x86_64.tar.gz"
      sha256 "32b41611e5157ae21d13e293384f40a0476b2bf1077447ed92c616a73cff9312"

      def install
        bin.install "ferlay-daemon-macos-x86_64" => "ferlay"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/y0sif/ferlay/releases/download/v#{version}/ferlay-daemon-linux-aarch64.tar.gz"
      sha256 "5469d5717445f6cf5d242e2379dcfe7fd52e569637081086652bc6601bef784c"

      def install
        bin.install "ferlay-daemon-linux-aarch64" => "ferlay"
      end
    else
      url "https://github.com/y0sif/ferlay/releases/download/v#{version}/ferlay-daemon-linux-x86_64.tar.gz"
      sha256 "086ccde40c3d88a040147b751a7061e4795ef5272eeb4e8eb07ad9530a67b0c6"

      def install
        bin.install "ferlay-daemon-linux-x86_64" => "ferlay"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ferlay --version")
  end
end
