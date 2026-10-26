class Lawh < Formula
  desc "Keyboard-driven whiteboard for people who think in Vim"
  homepage "https://github.com/y0sif/lawh"
  license all_of: ["MIT", "OFL-1.1"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/y0sif/lawh/releases/download/v0.1.0/lawh-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "702ad9f7a7632d1606b4635f1d000df0899dcaf94831b27c57849518154814fe"
    else
      url "https://github.com/y0sif/lawh/releases/download/v0.1.0/lawh-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "9a4ad5278ab709ad1c479c31ea56b4c6ca69f2d95071e1da6319dc4ed7d8c4a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/y0sif/lawh/releases/download/v0.1.0/lawh-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f12ed944f736bfb30160e5311ab48fa495ec5a6b4012408406e9f6af598a62e2"
    else
      url "https://github.com/y0sif/lawh/releases/download/v0.1.0/lawh-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e65c4e7482e71f45ade02aa4a457b0ebae02cebf4839b3f628b70fbc5de66f25"
    end
  end

  def install
    bin.install "lawh"
    prefix.install "THIRD-PARTY-LICENSES.txt", "Inter-OFL.txt", "Libertinus-OFL.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lawh --version")

    (testpath/"board.lawh").write <<~EOS
      lawh version=1
      circle id=c1 x=0 y=0 r=3
    EOS
    system bin/"lawh", "export", testpath/"board.lawh", testpath/"board.svg"
    assert_path_exists testpath/"board.svg"
  end
end
