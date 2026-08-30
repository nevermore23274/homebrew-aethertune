class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  license "MIT"
  version "0.11.1"

  on_macos do
    on_arm do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.1/AetherTune-v0.11.1-macos-aarch64.tar.gz"
      sha256 "9ab00ac7b3b898b95d56e8c8aba2ee23b31914b22b98551a12d92cafb8a5d7a7"
    end
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.1/AetherTune-v0.11.1-macos-x86_64.tar.gz"
      sha256 "58a38ab979c0490f5608fbb186e02612923aa314962b858a83374943a9d43dae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nevermore23274/AetherTune/releases/download/v0.11.1/AetherTune-v0.11.1-linux-x86_64.tar.gz"
      sha256 "521e6b9b5f78212ac888ff44f380df5fca7b3c2880320ff8e685d32a2d344b03"
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
