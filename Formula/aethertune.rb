class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  url "https://github.com/nevermore23274/AetherTune/releases/download/v0.5.1/AetherTune-v0.5.1-linux-x86_64.tar.gz"
  sha256 "d16ab136d50836bfc76eb3c060c913d35142b5974e4685efe4d9a8c654258cf9"
  license "MIT"
  version "0.5.1"

  depends_on :linux

  def install
    bin.install "AetherTune" => "aethertune"
  end

  def caveats
    <<~EOS
      AetherTune requires mpv and PulseAudio/PipeWire for full functionality:

        sudo apt install mpv pulseaudio-utils    # Debian/Ubuntu
        sudo pacman -S mpv pipewire-pulse        # Arch

      Without parec, the visualizer falls back to simulated mode.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aethertune --version 2>&1", 2)
  end
end
