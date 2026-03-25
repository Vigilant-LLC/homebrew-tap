class Fwknop < Formula
  desc "Single Packet Authorization and port knocking"
  homepage "https://www.cipherdyne.org/fwknop/"
  url "https://github.com/mrash/fwknop/archive/refs/tags/2.6.11.tar.gz"
  sha256 "b90c09982d82d9e197477f24dc49d07b362d0844f1bbfd0f68efae72e70db102"
  license "GPL-2.0-or-later"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "autoreconf", "--install", "--force", "--verbose"
    system "./configure", *std_configure_args,
                          "--disable-server",
                          "--with-gpgme=no"
    # Skip doc build (requires makeinfo/texinfo which may not be present)
    system "make", "install", "SUBDIRS=lib client"
  end

  test do
    system "#{bin}/fwknop", "--version"
  end
end
