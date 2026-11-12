class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "AGPL-3.0-only"
  version "1.2.1"

  on_macos do
    on_arm do
      url "https://github.com/kividbio/kividb/releases/download/v1.2.1/kividb-darwin-aarch64.tar.gz"
      sha256 "43c3c73f43686593006dd53e44d807ca68613a2b85734740d18511656555284e"
    end
    on_intel do
      url "https://github.com/kividbio/kividb/releases/download/v1.2.1/kividb-darwin-x86_64.tar.gz"
      sha256 "3de55cbc3536e5ced642ae0c1c810f22e8b5d211bc92dcc30cfc04fbe3e34767"
    end
  end

  def install
    bin.install "kividb"
    doc.install "LICENSE", "NOTICE"
  end

  service do
    run [opt_bin/"kividb"]
    keep_alive true
    log_path var/"log/kividb.log"
    error_log_path var/"log/kividb.error.log"
  end

  test do
    system "#{bin}/kividb", "--version"
  end
end
