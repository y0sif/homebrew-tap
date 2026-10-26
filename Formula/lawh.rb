class Lawh < Formula
  desc "Keyboard-driven whiteboard for people who think in Vim"
  homepage "https://github.com/y0sif/lawh"
  license all_of: ["MIT", "OFL-1.1"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/y0sif/lawh/releases/download/v0.1.1/lawh-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "b50e21a98ff6a08453a2cd224a2219c4f16bfc058a5c210ebc613c81a6845c82"
    else
      url "https://github.com/y0sif/lawh/releases/download/v0.1.1/lawh-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "a5f7a968e0fd766b35b1dfbca8c20593202cda0febc3a11c0fb782a7f7be2ca2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/y0sif/lawh/releases/download/v0.1.1/lawh-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24f8e278b03a0151392ecfc49c3fd180e558de876e30120b4ef1f769503a3e7f"
    else
      url "https://github.com/y0sif/lawh/releases/download/v0.1.1/lawh-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c646cbd994cfae8dc7b917f1c083922225779600e95d12fc54d39dacf47cc833"
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
