class Ferlay < Formula
  desc "Start and manage Claude Code sessions from your phone"
  homepage "https://github.com/y0sif/ferlay"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/y0sif/ferlay/releases/download/v#{version}/ferlay-daemon-macos-aarch64.tar.gz"
      sha256 "1692defd18fe1547fea863e440098939270a8ac983123611c03ef3b06715db39"

      def install
        bin.install "ferlay-daemon-macos-aarch64" => "ferlay"
      end
    else
      url "https://github.com/y0sif/ferlay/releases/download/v#{version}/ferlay-daemon-macos-x86_64.tar.gz"
      sha256 "821f760bfa9c05d9bd0bdcfb57b0858e9599cfa5f1167515781c3e18284fb6b0"

      def install
        bin.install "ferlay-daemon-macos-x86_64" => "ferlay"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/y0sif/ferlay/releases/download/v#{version}/ferlay-daemon-linux-aarch64.tar.gz"
      sha256 "c4395d588c2bd74698fcb16e2ff2fc33eb824630082022b2bd5cfd477d4ecb85"

      def install
        bin.install "ferlay-daemon-linux-aarch64" => "ferlay"
      end
    else
      url "https://github.com/y0sif/ferlay/releases/download/v#{version}/ferlay-daemon-linux-x86_64.tar.gz"
      sha256 "71d7704d57e1155c4228fd17385be3d1969be938ebc49fcf388b6c2931406d4e"

      def install
        bin.install "ferlay-daemon-linux-x86_64" => "ferlay"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ferlay --version")
  end
end
