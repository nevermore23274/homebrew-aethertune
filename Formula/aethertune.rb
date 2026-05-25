class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.8.2"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.8.2/AetherTune-v0.8.2-macos-aarch64.tar.gz"
      sha256 "214e9fb62e00e74c4565a0b8baea2e50444c829d1ca820c3570b0756e5f9419b"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.8.2/AetherTune-v0.8.2-macos-x86_64.tar.gz"
      sha256 "03b356e3dea898dad5eec33fae87c35a2f86c4b86553bd8a51d5c40fdab8a3b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.8.2/AetherTune-v0.8.2-linux-x86_64.tar.gz"
      sha256 "f14a5b142bfce4638385f83b5643eaa64626531edcf9e4794cf7e45ec85e0075"
    end
  end

  depends_on "mpv"

  def install
    bin.install "AetherTune" => "aethertune"
  end

  def caveats
    <<~EOS
      On Linux, you'll also need pulseaudio-utils or pipewire-pulse
      for real-time audio visualization.
      On macOS, the visualizer runs in simulated mode.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aethertune --version 2>&1", 2)
  end
end
