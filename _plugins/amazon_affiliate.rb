# -*- coding: utf-8 -*-

AMAZON_ASSOCIATE_ID = 'oku2008-22'
AMAZON_AFFILIATE_TEMPLATE_URL = '<amp-iframe src="https://rcm-fe.amazon-adsystem.com/e/cm?t=' + AMAZON_ASSOCIATE_ID + '&o=9&p=48&l=st1&mode=books-jp&search=&lt1=_blank&lc1=469AF6&bg1=FFFFFF&f=ifr" width="728" height="90" frameborder="0" scrolling="no"></amp-iframe>'

DEFAULT_MAKING_LINK_COUNT = 3

require 'yaml'

module Jekyll
  class AmazonAffiliateTag < Liquid::Tag
    def initialize(tag_name, ref, tokens)
      super
      @ref = ref
      @reference = ref.strip unless ref.nil?
      if ref =~ /\s*category:(\S+)/i
        @category = $1
      end
    end

    def render(context)
      unless @reference.nil?
        page = context.environments.first['page']
        categories = URI.escape(page['categories'].join("|"))
        AMAZON_AFFILIATE_TEMPLATE_URL.gsub(/search=/, "search=#{categories}")
      end
    end
  end
end

Liquid::Template.register_tag('amazon_affiliate', Jekyll::AmazonAffiliateTag)
