class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "AGPL-3.0-only"
  version "1.1.1"

  on_macos do
    on_arm do
      url "https://github.com/kividbio/kividb/releases/download/v1.1.1/kividb-darwin-aarch64.tar.gz"
      sha256 "853327e8fe52b622c9425c21cf4974115eec5f43fe47479e4d5571c6f40dce22"
    end
    on_intel do
      url "https://github.com/kividbio/kividb/releases/download/v1.1.1/kividb-darwin-x86_64.tar.gz"
      sha256 "82b2f7ecfd3054b5ede8e57c97694d8dc870625c6a6749acdb3b624ccfb779b9"
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
