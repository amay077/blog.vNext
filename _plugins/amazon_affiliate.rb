# -*- coding: utf-8 -*-

AMAZON_ASSOCIATE_ID = 'oku2008-22'
AMAZON_AFFILIATE_TEMPLATE_URL = 'https://ws-fe.assoc-amazon.com/widgets/cm?o=9&p=48&l=ur1&category=manga_anime&f=ifr&linkID=df82ebeeda21125f8fc45ac1de9b5e8c&t=' + AMAZON_ASSOCIATE_ID + '&tracking_id=' + AMAZON_ASSOCIATE_ID + '" width="728" height="90" frameborder="0" scrolling="no"></amp-iframe>'

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
