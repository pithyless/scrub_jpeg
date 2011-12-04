require "scrub_jpeg/version"
require 'exiv2'

module ScrubJpeg
  class Scrubber
    def initialize(filename)
      info "Scrubbing... #{filename}"
      @image = Exiv2::ImageFactory.open(filename)
      @image.read_metadata
    rescue Exiv2::BasicError
      warn "Cannot open file: #{filename}"
    end

    def scrub!
      delete_all_iptc_tags
      delete_all_exif_tags
      delete_all_xmp_tags
      @image.write_metadata
    end

    private

    def iptc_tags
      @image.iptc_data.map(&:first)
    end

    def exif_tags
      @image.exif_data.map(&:first)
    end

    def xmp_tags
      @image.xmp_data.map(&:first)
    end

    def delete_all_iptc_tags
      iptc_tags.each { |x| @image.iptc_data.delete_all(x) }
    end

    def delete_all_exif_tags
      exif_tags.each { |x| @image.exif_data.delete_all(x) }
    end

    def delete_all_xmp_tags
      xmp_tags.each { |x| @image.xmp_data.delete_all(x) }
    end

    def info(msg)
      puts "#{msg}"
    end

    def warn(msg)
      puts "[WARNING] #{msg}"
    end
  end
end
