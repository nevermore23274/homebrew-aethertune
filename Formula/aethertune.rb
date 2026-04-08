class Aethertune < Formula
  desc "Terminal-based internet radio player with real-time audio visualization, built in Rust"
  homepage "https://github.com/nevermore23274/AetherTune"
  url "https://github.com/nevermore23274/AetherTune/releases/download/v0.5.0/AetherTune-v0.5.0-linux-x86_64.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"
  version "0.5.0"

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
    assert_match "AetherTune", shell_output("#{bin}/aethertune --help 2>&1", 1)
  end
end