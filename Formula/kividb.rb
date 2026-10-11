class Kividb < Formula
  desc "A fast Redis-compatible in-memory store written in Rust"
  homepage "https://kividb.io/"
  license "LicenseRef-EULA"
  version "1.0.6-rc1"

  on_macos do
    on_arm do
      url "https://releases.kividb.io/v1.0.6-rc1/kividb-darwin-aarch64.tar.gz"
      sha256 "3a3bcce45aa55217dd7adeac739973cae708fd9316f79ff0707fc4db94b882ae"
    end
    on_intel do
      url "https://releases.kividb.io/v1.0.6-rc1/kividb-darwin-x86_64.tar.gz"
      sha256 "1ddda27dc0dd036ece74b8d43b835fdab479b431a323155ec51dd5890439a644"
    end
  end

  def install
    bin.install "kividb"
    doc.install "LICENSE"
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
